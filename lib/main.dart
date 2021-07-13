import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:seafarer/seafarer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl;
import 'core/config/injectable/injection.dart';
import 'core/config/router/router.dart';
import 'core/config/theme/themes.dart';
import 'core/l10n/l10n.dart';
import 'core/utils/add_post_frame_callback.dart';
import 'features/languages/presentation/pages/languages_page.dart';
import 'features/splash/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'features/splash/presentation/pages/splash_page.dart';
import 'features/welcome/presentation/pages/login_page.dart';
import 'features/welcome/presentation/pages/register_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  final environment = Env.dev;
  configureInjection(environment);
  await DotEnv().load(fileName: '.env/.env.$environment');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Vx.gray800,
  ));
  Routes.createRoutes();
  EquatableConfig.stringify = true;
  runApp(Application());
}

class Application extends StatefulWidget {
  Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  SplashBloc _splashBloc = getIt<SplashBloc>();

  @override
  void initState() {
    addPostFrameCallback((_) {
      // EyroToastSetup.shared.navigatorKey = Routes.seafarer.navigatorKey;
      final arLang = intl.DateFormat("", "ar");
      arLang.dateSymbols.ZERODIGIT = "0";
    });
    super.initState();
  }

  @override
  void dispose() {
    _splashBloc.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _splashBloc..add(SplashEvent.started()),
      child: MaterialApp(
        title: "Foodyn Restaurant",
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: SplashPage.kRouteName,
        navigatorKey: Routes.seafarer.navigatorKey,
        onGenerateRoute: Routes.seafarer.generator(),
        theme: appThemeData[AppTheme.Light],
        darkTheme: appThemeData[AppTheme.Dark],
        builder: (context, child) {
          return BlocConsumer<SplashBloc, SplashState>(listener: (context, state) {
            state.type.maybeWhen(
                getSplashSucceed: () {
                  new Future.delayed(new Duration(seconds: 5), () {
                    state.status.maybeWhen(
                    firstTime: () {
                      if (state.locale == null)
                        Routes.seafarer.navigate(
                          LanguagesPage.kRouteName,
                          navigationType: NavigationType.pushAndRemoveUntil,
                          params: {
                            "firstTime": true
                          },
                          removeUntilPredicate: (route) {
                            return false;
                          },
                        );
                    },
                    start: () {
                      Routes.seafarer.navigate(
                        RegisterPage.kRouteName,
                        navigationType: NavigationType.pushAndRemoveUntil,
                        removeUntilPredicate: (route) {
                          return false;
                        },
                      );
                    },
                    orElse: () {},
                  );
                  });
                },
                orElse: () {});
          }, buildWhen: (previous, current) {
            if (current.locale?.languageCode != previous.locale?.languageCode)
              return true;
            return false;
          }, builder: (context, state) {
            return Directionality(
              textDirection: state.locale?.languageCode == "ar"
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: child!,
            );
          });
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}