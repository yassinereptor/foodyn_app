import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/services/validator_service.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import 'verify_otp_page.dart';
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
  late AuthBloc _authBloc;
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    super.initState();
  }

  void _onSuccess(String? _currentOtp) {}

  void _onError(String? _currentOtp) {}

  void _forgetPassword() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState!.validate()) {
      _authBloc.add(AuthEvent.forgetPassword(emailTextEditingController.text));
    }
  }
  
  void _onModalReset() {
    setState(() {
      _showModal = false;
      _modalType = ModalContainerType.LOADING;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.type.maybeWhen(
            loadingInProgress: () {
              setState(() {
                _showModal = true;
                _modalType = ModalContainerType.LOADING;
              });
            },
            loadingSuccess: () {
              setState(() {
                _modalType = ModalContainerType.SUCCESS;
              });
              Future.delayed(Duration(milliseconds: 2000), () {
                _onModalReset();
                Routes.seafarer.navigate(VerifyOtpPage.kRouteName, params: {
                  "title": "Verify Email",
                  "logout": false,
                  "onSuccess": _onSuccess,
                  "onError": _onError,
                });
              });
            },
            loadingFailed: (failure) {
              setState(() {
                _modalType = ModalContainerType.FAILURE;
              });
              Future.delayed(Duration(milliseconds: 2000), () {
                _onModalReset();
              });
            },
            orElse: () {});
      },
      builder: (context, state) {
        return ScaffoldContainerWidget(
          type: _modalType,
          show: _showModal,
          onReset: _onModalReset,
          title: "Forget Password",
          children: [
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
                  ButtonWidget(
                    onTap: _forgetPassword,
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
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
