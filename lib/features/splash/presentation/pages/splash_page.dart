import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashPage extends StatefulWidget {
  static const kRouteName = "/";

  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AuthBloc _authBloc;
  
  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => Scaffold(
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Hero(
                    tag: "splash_logo",
                    child: Image.asset(
                      isDark(context)? "assets/logos/foodyn_horizental_light_logo.png" : "assets/logos/foodyn_horizental_dark_logo.png",
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.width / 1.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("FOODYN RESTAURANT POWERED BY UNIKSOL"),
                  )
                ],
              ),
            )
          ),
      ),
    );
  }
}
