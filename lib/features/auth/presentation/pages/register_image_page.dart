import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/core/bloc/auth_bloc/auth_bloc.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../../core/domain/entities/app_failure.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/enums/image.type.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'package:mime/mime.dart';
import 'package:velocity_x/velocity_x.dart';

import 'choose_plan_page.dart';

class RegisterImagePage extends StatefulWidget {
  static const kRouteName = "/register-image";

  const RegisterImagePage({Key? key}) : super(key: key);

  @override
  _RegisterImagePageState createState() => _RegisterImagePageState();
}

class _RegisterImagePageState extends State<RegisterImagePage> {
  File? _file;
  late AuthBloc _authBloc;
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;
  File? _uploaded;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _file = null;
  }

  Future<void> _pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  _onTapContinue() async {
    if (_file != null && (_uploaded == null || _uploaded != _file)) {
      if (_file!.lengthSync() > 4194304) {
        final snackBar =
            SnackBar(content: Text("Image must be less than 4 MB"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      if (lookupMimeType(_file!.path)!.split("/")[0] != "image") {
        final snackBar = SnackBar(content: Text("File is not an image"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      setState(() {
        _showModal = true;
        _modalType = ModalContainerType.LOADING;
      });
      _authBloc.add(AuthEvent.uploadImage(ImageType.PROFILE, _file!));
    } else if (_uploaded == _file)
      Routes.seafarer.navigate(ChoosePlanPage.kRouteName);
  }

  void _onStateLoadingInProgress() {
  }

  void _onStateLoadingSuccess() {
    setState(() {
      _modalType = ModalContainerType.SUCCESS;
      _uploaded = _file;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      _onModalReset();
      Routes.seafarer.navigate(ChoosePlanPage.kRouteName);
    });
  }

  void _onStateLoadingFailure(AppFailure failure) {
    setState(() {
      _modalType = ModalContainerType.FAILURE;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      _onModalReset();
    });
  }

  String _getFileSize(File file, int decimals) {
    int bytes = file.lengthSync();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  void _onModalReset() {
    setState(() {
      _showModal = false;
      _modalType = ModalContainerType.LOADING;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _imageWidth = MediaQuery.of(context).size.width - 100;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.type.maybeWhen(
            loadingInProgress: _onStateLoadingInProgress,
            loadingSuccess: _onStateLoadingSuccess,
            loadingFailed: _onStateLoadingFailure,
            orElse: () {});
      },
      builder: (context, state) {
        return ScaffoldContainerWidget(
          type: _modalType,
          show: _showModal,
          onReset: _onModalReset,
          logout: true,
          title: "Tap To Add An Image",
          subtitle: "the limit size is 4 MB",
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: _pickImage,
                child: Center(
                  child: Container(
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
                                      color: Colors.black.withOpacity(.3),
                                      shape: BoxShape.circle),
                                ),
                                Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      size: 50,
                                      color: GlobalTheme.kAccentDarkColor,
                                    ),
                                    if (_file != null)
                                      _getFileSize(_file!, 0)
                                          .text
                                          .sm
                                          .color(Colors.white)
                                          .make(),
                                  ],
                                ))
                              ],
                            ),
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
            ButtonWidget(
              background: isDark(context)
                  ? GlobalTheme.kPrimaryLightColor
                  : GlobalTheme.kAccentDarkColor,
              onTap: () {
                Routes.seafarer.navigate(ChoosePlanPage.kRouteName);
              },
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
          ],
        );
      },
    );
  }
}
