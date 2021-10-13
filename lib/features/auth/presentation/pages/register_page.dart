import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/botton_widget.dart';
import '../../../../core/domain/entities/app_failure.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/services/validator_service.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import '../widgets/password_text_form_widget.dart';
import '../widgets/text_form_widget.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'package:seafarer/seafarer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'complete_register_page.dart';
import 'learnmore_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  static const kRouteName = "/register";

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  late AuthBloc _authBloc;
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onRegister() {
    FocusScope.of(context).requestFocus(FocusNode());
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate())
      _authBloc.add(AuthEvent.register(
          emailTextEditingController.text, passwordTextEditingController.text));
  }

  void _onStateLoadingInProgress() {
    setState(() {
      _showModal = true;
      _modalType = ModalContainerType.LOADING;
    });
  }

  void _onStateLoadingSuccess() {
    setState(() {
      _modalType = ModalContainerType.SUCCESS;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      Routes.seafarer.navigate(
        CompleteRegisterPage.kRouteName,
        navigationType: NavigationType.pushAndRemoveUntil,
        removeUntilPredicate: (route) => false,
      );
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
            loadingInProgress: _onStateLoadingInProgress,
            loadingSuccess: _onStateLoadingSuccess,
            loadingFailed: _onStateLoadingFailure,
            orElse: () {});
      },
      builder: (context, state) {
        return Scaffold(
            body: ModalContainerWidget(
                type: _modalType,
                show: _showModal,
                onReset: _onModalReset,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Spacer(),
                            Hero(
                              tag: "splash_logo",
                              child: Image.asset(
                                isDark(context)
                                    ? "assets/logos/foodyn_vertical_light_logo.png"
                                    : "assets/logos/foodyn_vertical_dark_logo.png",
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 30,
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
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator:
                                            ValidatorService.emailValidator,
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: PasswordTextFormWidget(
                                        controller:
                                            passwordTextEditingController,
                                      )),
                                  ButtonWidget(
                                    onTap: _onRegister,
                                    children: [
                                      "Register"
                                          .text
                                          .xl
                                          .color((isDark(context))
                                              ? GlobalTheme.kPrimaryColor
                                              : GlobalTheme.kAccentColor)
                                          .make(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  "Already have an account".text.xl.make(),
                                  InkWell(
                                    onTap: () => Routes.seafarer
                                        .navigate(LoginPage.kRouteName),
                                    child: "Log in"
                                        .text
                                        .xl
                                        .color(GlobalTheme.kOrangeColor)
                                        .make(),
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: () => Routes.seafarer
                                    .navigate(LearnmorePage.kRouteName),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        "Learn More"
                                            .text
                                            .xl
                                            .color(GlobalTheme.kOrangeColor)
                                            .make(),
                                        RotatedBox(
                                            quarterTurns: 3,
                                            child: Icon(Icons.arrow_back_ios)),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
      },
    );
  }
}
