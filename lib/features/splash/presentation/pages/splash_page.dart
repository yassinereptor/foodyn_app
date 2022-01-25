import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/core/bloc/config_bloc/config_bloc.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashPage extends StatefulWidget {
  static const kRouteName = "/";

  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late ConfigBloc _configBloc;

  @override
  void initState() {
    _configBloc = context.read<ConfigBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String message = "Loading ...";

    return BlocBuilder<ConfigBloc, ConfigState>(
      builder: (context, state) {
        state.type.maybeWhen(
          loadingInProgress: () {
            message = "Loading Ressources ...";
          },
          loadingFailed: (_) {
            message = "Failed !";
          },
          orElse: (){
            message = "Loading ...";
        });
        return Scaffold(
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
                  isDark(context)
                      ? "assets/logos/foodyn_horizental_light_logo.png"
                      : "assets/logos/foodyn_horizental_dark_logo.png",
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.width / 1.5,
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
              message.text.xl.make(),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(20),
                child: "FOODYN RESTAURANT POWERED BY UNIKSOL".text.sm.make(),
              )
            ],
          ),
        )),
      );
      },
    );
  }
}
