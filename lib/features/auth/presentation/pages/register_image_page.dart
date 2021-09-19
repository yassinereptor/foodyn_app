import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/injectable/injection.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/enums/image.type.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/core/widgets/modal_container_widget.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:foodyn_rest/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/sliver_app_bar_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/resend_email_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mime/mime.dart';

import 'package:velocity_x/velocity_x.dart';

import 'choose_plan_page.dart';
import 'learnmore_page.dart';
import 'login_page.dart';

class RegisterImagePage extends StatefulWidget {
  static const kRouteName = "/register-image";

  const RegisterImagePage({Key? key}) : super(key: key);

  @override
  _RegisterImagePageState createState() => _RegisterImagePageState();
}

class _RegisterImagePageState extends State<RegisterImagePage> {
  File? _file;
  late AuthBloc _authBloc;
  late ProfileBloc _ProfileBloc;
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;
  
  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _ProfileBloc = getIt<ProfileBloc>();
    _file = null;
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image
    );

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  _onTapContinue() async {
    if (_file != null)
    {
      if (_file!.lengthSync() > 4194304)
      {
        final snackBar = SnackBar(content: Text("Image must be less than 4 MB"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return ;
      }
      if (lookupMimeType(_file!.path)!.split("/")[0] != "image")
      {
          final snackBar = SnackBar(content: Text("File is not an image"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return ;
      }
      setState(() {
        _showModal = true;
        _modalType = ModalContainerType.LOADING;
      });
      _ProfileBloc.add(ProfileEvent.uploadImage(ImageType.PROFILE, _file!));
    }
  }

  
  void _onTypeloadingInProgress () {
    
  }

  void _onTypeloadingSuccess () {
    setState(() {
        _modalType = ModalContainerType.SUCCESS;
    });
      Future.delayed(Duration(milliseconds: 2000), () {
        setState(() {
          _showModal = false;
          _modalType = ModalContainerType.LOADING;
        });
        Routes.seafarer.navigate(ChoosePlanPage.kRouteName);
    });
    
  }

  void _onTypeloadingFailure (AuthFailure failure) {
    setState(() {
      _modalType = ModalContainerType.FAILURE;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _showModal = false;
        _modalType = ModalContainerType.LOADING;
      });
    });
  }

  void _modalReset() {
    setState(() {
      _showModal = false;
      _modalType = ModalContainerType.LOADING;
    });
  }

  String _getFileSize(File file, int decimals) {
    int bytes = file.lengthSync();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];  
  }


  @override
  Widget build(BuildContext context) {
    double _imageWidth = MediaQuery.of(context).size.width - 100;

    return BlocProvider(
      create: (context) => _ProfileBloc,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            loadingInProgress: _onTypeloadingInProgress,
            loadingSuccess: _onTypeloadingSuccess,
            loadingFailed: _onTypeloadingFailure,
            orElse: (){}
            );
        },
        builder: (context, state) {
          return Scaffold(
              body: ModalContainerWidget(
                onLoading: _modalReset,
                onSucceed: _modalReset,
                onFailed: _modalReset,
                type: _modalType,
                show: _showModal,
                child: SafeArea(
                    child: CustomScrollView(shrinkWrap: true, slivers: [
                          SliverAppBarWidget(logout: true),
                          SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      child: Column(
                        children: [
                          ResendEmailWidget(),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 15),
                                child: "Tap To Add An Image".text.xl2.make(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 15),
                                child: "the limit size is 4 MB"
                                    .text
                                    .sm
                                    .make(),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: _pickImage,
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20),
                                width: _imageWidth,
                                height: _imageWidth,
                                decoration: BoxDecoration(
                                    color: isDark(context)
                                        ? GlobalTheme.kPrimaryLightColor
                                        : GlobalTheme.kAccentDarkColor,
                                    shape: BoxShape.circle),
                                child: (_file == null)
                                    ? Center(
                                        child: Icon(
                                          Icons.upload_rounded,
                                          size: 50,
                                          color: GlobalTheme.kOrangeColor,
                                        ),
                                      )
                                    : SizedBox(
                                        width: _imageWidth,
                                        height: _imageWidth,
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: FileImage(_file!),
                                                      fit: BoxFit.cover),
                                                  shape: BoxShape.circle),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(.3),
                                                  shape: BoxShape.circle),
                                            ),
                                            Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.edit,
                                                    size: 50,
                                                    color:
                                                        GlobalTheme.kAccentDarkColor,
                                                  ),
                                                  if (_file != null)
                                                  _getFileSize(_file!, 0)
                                                  .text
                                                  .sm
                                                  .color(Colors.white)
                                                  .make(),
                                                ],
                                              )
                                            )
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: _onTapContinue,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: GlobalTheme.kOrangeColor,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: Vx.mH32,
                              height: 65.0,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    "Continue"
                                        .text
                                        .xl
                                        .color((isDark(context))
                                            ? GlobalTheme.kPrimaryColor
                                            : GlobalTheme.kAccentColor)
                                        .make(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Routes.seafarer.navigate(ChoosePlanPage.kRouteName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: isDark(context)
                                      ? GlobalTheme.kPrimaryLightColor
                                      : GlobalTheme.kAccentDarkColor,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: Vx.mH32,
                              height: 65.0,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    "Skip"
                                        .text
                                        .xl
                                        .color((isDark(context))
                                            ? GlobalTheme.kAccentColor
                                            : GlobalTheme.kPrimaryColor)
                                        .make(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                          )
                        ])),
              ));
        },
      ),
    );
  }
}
