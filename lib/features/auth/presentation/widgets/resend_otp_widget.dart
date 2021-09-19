import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/injectable/injection.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/models/user_model.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/auth/domain/entities/auth_failure.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:velocity_x/velocity_x.dart';

class ResendOTPWidget extends StatefulWidget {
  
  const ResendOTPWidget({Key? key}) : super(key: key);

  @override
  _ResendOTPWidgetState createState() => _ResendOTPWidgetState();
}

class _ResendOTPWidgetState extends State<ResendOTPWidget> {
  late AuthBloc _authBloc;
  late OtpBloc _otpBloc;
  bool _startTimer = false;
  final CountdownController _countdownController =
      new CountdownController(autoStart: false);
  late int dialCode;
  late String phoneNumber;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    _otpBloc = getIt<OtpBloc>();
    dialCode = _authBloc.state.user!.profile!.dialCode!;
    phoneNumber = _authBloc.state.user!.profile!.phoneNumber!;
    super.initState();
  }

  
  void _onTapResend() {
    _countdownController.restart();
    setState(() {
      _startTimer = true;
    });
    FocusScope.of(context).requestFocus(FocusNode());
    _otpBloc.add(OtpEvent.sendOtp(dialCode, phoneNumber));
  }

  void _onTypeloadingSending() {}

  void _onTypeloadingSent() {
      final snackBar = SnackBar(content: Text("Code sent"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onTypeloadingFailure(AuthFailure failure) {
    final snackBar = SnackBar(content: Text("Resend code failed !"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onTimerEnd() {
    setState(() {
      _startTimer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _otpBloc,
      child: BlocConsumer<OtpBloc, OtpState>(
        listener: (context, state) {
          state.maybeWhen(
              loadingSending: _onTypeloadingSending,
              loadingSent: _onTypeloadingSent,
              loadingFailed: _onTypeloadingFailure,
              orElse: () {});
        },
        builder: (context, state) {
          Widget _resendButtonWidget = GestureDetector(
              onTap: _onTapResend,
              child: Text(
                "Resend code",
                textAlign: TextAlign.center,
                style: TextStyle(color: GlobalTheme.kOrangeColor),
              ));
   
          if (_authBloc.state.user!.profile != null && _authBloc.state.user!.profile!.phoneNumberVerified != null && _authBloc.state.user!.profile!.phoneNumberVerified!) return Container();
          return Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isDark(context)
                    ? GlobalTheme.kPrimaryLightColor
                    : GlobalTheme.kAccentDarkColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You need to verify your phone number in order to add it to your profile.",
                  textAlign: TextAlign.center,
                ),
                Countdown(
                  controller: _countdownController,
                  seconds: 60,
                  build: (BuildContext context, double time) => Text((_startTimer ? time.toString() : "If you didn't get the code")),
                  interval: Duration(milliseconds: 100),
                  onFinished: _onTimerEnd,
                ),
                _startTimer ? Container() :
                _resendButtonWidget,
              ],
            ),
          );
        },
      ),
    );
  }
}
