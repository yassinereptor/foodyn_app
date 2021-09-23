import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/domain/entities/auth_failure.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/bloc/otp_bloc/otp_bloc.dart';
import '../widgets/resend_otp_widget.dart';
import '../widgets/sliver_app_bar_widget.dart';
import '../widgets/resend_email_widget.dart';
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
  late OtpBloc _otpBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthBloc>();
    _otpBloc = getIt<OtpBloc>();
    _otpBloc.add(OtpEvent.sendOtp(_authBloc.state.user!.profile!.dialCode!, _authBloc.state.user!.profile!.phoneNumber!));
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return '●';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _authBloc,
        ),
        BlocProvider(
          create: (context) => _otpBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {},
          ),
          BlocListener<OtpBloc, OtpState>(
            listener: (context, state) {
              state.maybeWhen(
                loadingSuccess: (){
                  widget.onSuccess();
                },
                loadingFailed: (AuthFailure failure){
                  widget.onError("Can't send Otp right now !");
                },
                orElse: (){});
            },
          ),
        ],
        child: Scaffold(
              body: SafeArea(
                  child: CustomScrollView(shrinkWrap: true, slivers: [
            SliverAppBarWidget(logout: widget.logout),
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
                              child: widget.title.text.xl2.make(),
                            ),
                          ],
                        ),
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
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    _otpBloc.add(OtpEvent.verifyOtp(_currentOtp!));
                                  }
                                },
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
                                        "Verify"
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
                              SizedBox(height: 20,),
                              InkWell(
                                onTap: () {
                                  widget.onSuccess();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isDark(context) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: Vx.mH32,
                                  height: 65.0,
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                      ],
                    ),
                  ),
                ),
              ),
            )
          ])))
      ),
    );
  }
}
