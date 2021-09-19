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
import 'package:foodyn_rest/features/auth/presentation/bloc/mail_bloc/mail_bloc.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:velocity_x/velocity_x.dart';

class ResendEmailWidget extends StatefulWidget {
  const ResendEmailWidget({Key? key}) : super(key: key);

  @override
  _ResendEmailWidgetState createState() => _ResendEmailWidgetState();
}

class _ResendEmailWidgetState extends State<ResendEmailWidget> {
  late AuthBloc _authBloc;
  late MailBloc _mailBloc;
  bool _startTimer = false;
  final CountdownController _countdownController =
      new CountdownController(autoStart: false);

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    _mailBloc = getIt<MailBloc>();
    _mailBloc.add(MailEvent.confirmationEmailStatus());
    super.initState();
  }

  @override
  void dispose() {
    _mailBloc.close();
    super.dispose();
  }

  void _onTapResend() {
    _countdownController.restart();
    setState(() {
      _startTimer = true;
    });
    FocusScope.of(context).requestFocus(FocusNode());
    _mailBloc.add(MailEvent.resendConfirmationEmail(
        _authBloc.state.user!.email!));
  }

  void _onTypeloadingInProgress() {}

  void _onTypeloadingSuccess(UserModel? userModel) {
    if (userModel == null){
      final snackBar = SnackBar(content: Text("Email sent"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else
      _authBloc.state.user!.verified = userModel.verified;
  }

  void _onTypeloadingFailure(AuthFailure failure) {
    final snackBar = SnackBar(content: Text("Resend email failed !"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onTimerEnd() {
    setState(() {
      _startTimer = false;
    });
    _mailBloc.add(MailEvent.confirmationEmailStatus());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _mailBloc,
      child: BlocConsumer<MailBloc, MailState>(
        listener: (context, state) {
          state.maybeWhen(
              loadingInProgress: _onTypeloadingInProgress,
              loadingSuccess: _onTypeloadingSuccess,
              loadingFailed: _onTypeloadingFailure,
              orElse: () {});
        },
        builder: (context, state) {
          Widget _resendButtonWidget = GestureDetector(
              onTap: _onTapResend,
              child: Text(
                "Resend email",
                textAlign: TextAlign.center,
                style: TextStyle(color: GlobalTheme.kOrangeColor),
              ));
   
          if (_authBloc.state.user != null && _authBloc.state.user!.verified!) return Container();
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
                  "You need to verify your email in order to use your account.",
                  textAlign: TextAlign.center,
                ),
                Countdown(
                  controller: _countdownController,
                  seconds: 60,
                  build: (BuildContext context, double time) => Text((_startTimer ? time.toString() : "If you didn't get a verification email")),
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