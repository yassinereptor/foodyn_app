import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/core/bloc/send_bloc/send_bloc.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../../core/domain/entities/app_failure.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../widgets/resend_otp_widget.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import '../widgets/verify_phone_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class VerifyOtpPage extends StatefulWidget {
  static const kRouteName = "/verify-otp";
  final String title;
  final bool logout;
  final void Function() onSuccess;
  final void Function(String?) onError;

  const VerifyOtpPage(
      {Key? key,
      required this.title,
      required this.logout,
      required this.onSuccess,
      required this.onError})
      : super(key: key);

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final _formKey = GlobalKey<FormState>();
  String? _currentOtp;
  late AuthBloc _authBloc;
  late SendBloc _otpBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _otpBloc = getIt<SendBloc>();
    _otpBloc.add(SendEvent.sendOtp(_authBloc.state.user!.dialCode!,
        _authBloc.state.user!.phoneNumber!));
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return '●';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) => _otpBloc,
      child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {},
            ),
            BlocListener<SendBloc, SendState>(
              listener: (context, state) {
                state.maybeWhen(
                    loadingSuccess: (_) {
                      widget.onSuccess();
                    },
                    loadingFailed: (AppFailure failure) {
                      widget.onError("Can't send Otp right now !");
                    },
                    orElse: () {});
              },
            ),
          ],
          child: ScaffoldContainerWidget(
            title: widget.title,
            logout: widget.logout,
            children: [
              ResendOTPWidget(),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    VerifyPhoneWidget(
                        validator: _validator,
                        length: 4,
                        onChanged: (otp) {},
                        onCompleted: (otp) {
                          setState(() {
                            _currentOtp = otp;
                          });
                        }),
                    ButtonWidget(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _otpBloc.add(SendEvent.verifyOtp(_currentOtp!));
                        }
                      },
                      children: [
                        "Verify"
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
                    ButtonWidget(
                      onTap: () {
                        widget.onSuccess();
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
                ),
              ),
            ],
          )),
    );
  }
}
