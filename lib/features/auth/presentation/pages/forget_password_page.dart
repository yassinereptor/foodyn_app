import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/services/validator_service.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import 'verify_otp_page.dart';
import '../widgets/sliver_app_bar_widget.dart';
import '../widgets/text_form_widget.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const kRouteName = "/forget-password";

  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  AuthBloc _authBloc = getIt<AuthBloc>();
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;

  @override
  void initState() {
    super.initState();
  }

  void _onSuccess(String? _currentOtp) {

  }

  void _onError(String? _currentOtp) {

  }

  void _forgetPassword() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState!.validate()) {
      _authBloc.add(AuthEvent.forgetPassword(emailTextEditingController.text));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.type.maybeWhen(
            loadingInProgress: () {
              setState(() {
                _showModal = true;
                _modalType = ModalContainerType.LOADING;
                // _authBloc.close();
              });
            },
            loadingSuccess: (){
              setState(() {
                _modalType = ModalContainerType.SUCCESS;
              });
               Future.delayed(Duration(milliseconds: 2000), () {
                setState(() {
                  _showModal = false;
                  _modalType = ModalContainerType.LOADING;
                  Routes.seafarer
                  .navigate(VerifyOtpPage.kRouteName, params: {
                    "title": "Verify Email",
                    "logout": false,
                    "onSuccess": _onSuccess,
                    "onError": _onError,
                  });
                });
              });
            },
            loadingFailed: (failure){
              setState(() {
                _modalType = ModalContainerType.FAILURE;
              });
              Future.delayed(Duration(milliseconds: 2000), () {
                setState(() {
                  _showModal = false;
                  _modalType = ModalContainerType.LOADING;
                });
              });
            },
            orElse: (){}
          );
        },
        builder: (context, state) {
          return Scaffold(
              body: ModalContainerWidget(
                onLoading: () {
                  setState(() {
                    _showModal = false;
                    _modalType = ModalContainerType.LOADING;
                  });
                },
                onSucceed: () {
                  setState(() {
                    _showModal = false;
                    _modalType = ModalContainerType.LOADING;
                  });
                },
                onFailed: () {
                  setState(() {
                    _showModal = false;
                    _modalType = ModalContainerType.LOADING;
                  });
                },
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
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 15),
                                child: "Forget Password".text.xl2.make(),
                              ),
                            ],
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: TextFormWidget(
                                      controller: emailTextEditingController,
                                      onChanged: (_) {},
                                      hint: "Email",
                                      keyboardType: TextInputType.emailAddress,
                                      validator: ValidatorService.emailValidator,
                                    )),
                                InkWell(
                                  onTap: _forgetPassword,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: GlobalTheme.kOrangeColor,
                                        borderRadius: BorderRadius.circular(10)),
                                    padding: Vx.mH32,
                                    height: 65.0,
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          "Recover"
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
                              ],
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
