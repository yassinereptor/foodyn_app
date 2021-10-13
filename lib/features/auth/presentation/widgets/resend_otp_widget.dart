import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/bloc/send_bloc/send_bloc.dart';
import 'package:foodyn_rest/core/data/models/user_model.dart';
import '../../../../core/domain/entities/app_failure.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ResendOTPWidget extends StatefulWidget {
  
  const ResendOTPWidget({Key? key}) : super(key: key);

  @override
  _ResendOTPWidgetState createState() => _ResendOTPWidgetState();
}

class _ResendOTPWidgetState extends State<ResendOTPWidget> {
  late AuthBloc _authBloc;
  late SendBloc _sendBloc;
  bool _startTimer = false;
  final CountdownController _countdownController =
      new CountdownController(autoStart: false);
  late int dialCode;
  late String phoneNumber;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    _sendBloc = getIt<SendBloc>();
    dialCode = _authBloc.state.user!.dialCode!;
    phoneNumber = _authBloc.state.user!.phoneNumber!;
    super.initState();
  }

  
  void _onTapResend() {
    _countdownController.restart();
    setState(() {
      _startTimer = true;
    });
    FocusScope.of(context).requestFocus(FocusNode());
    _sendBloc.add(SendEvent.sendOtp(dialCode, phoneNumber));
  }

  void _onStateLoadingInProgress() {}

  void _onStateLoadingSuccess(UserModel? user) {
      final snackBar = SnackBar(content: Text("Code sent"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onStateLoadingFailure(AppFailure failure) {
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
      create: (context) => _sendBloc,
      child: BlocConsumer<SendBloc, SendState>(
        listener: (context, state) {
          state.maybeWhen(
              loadingInProgress: _onStateLoadingInProgress,
              loadingSuccess: _onStateLoadingSuccess,
              loadingFailed: _onStateLoadingFailure,
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
   
          if (_authBloc.state.user != null && _authBloc.state.user!.phoneNumberVerified != null && _authBloc.state.user!.phoneNumberVerified!) return Container();
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
