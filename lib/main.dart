import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodyn_rest/features/auth/presentation/pages/complete_register_page.dart';
import 'package:foodyn_rest/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:seafarer/seafarer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl;
import 'core/config/injectable/injection.dart';
import 'core/config/router/router.dart';
import 'core/config/theme/themes.dart';
import 'core/l10n/l10n.dart';
import 'core/utils/add_post_frame_callback.dart';
import 'core/widgets/dialogs/jwt_expired_dialog.dart';
import 'features/auth/domain/entities/auth_failure.dart';
import 'features/languages/presentation/pages/languages_page.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/splash/presentation/pages/splash_page.dart';
import 'features/auth/presentation/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  final environment = Env.dev;
  configureInjection(environment);
  await dotenv.load(fileName: '.env/.env.$environment');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Vx.gray800,
  ));
  Routes.createRoutes();
  EquatableConfig.stringify = true;
  await initHiveForFlutter();
  runApp(Application());
}

class Application extends StatefulWidget {
  Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  AuthBloc _authBloc = getIt<AuthBloc>();

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
    _authBloc.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc..add(AuthEvent.started()),
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
          return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
            state.type.maybeWhen(
                loadingSuccess: () {
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
                    unauthenticated: () {
                      Routes.seafarer.navigate(
                        RegisterPage.kRouteName,
                        navigationType: NavigationType.pushAndRemoveUntil,
                        removeUntilPredicate: (route) {
                          return false;
                        },
                      );
                    },
                    authenticated: () {
                      if (state.user == null){
                        Routes.seafarer.navigate(
                          RegisterPage.kRouteName,
                          navigationType: NavigationType.pushAndRemoveUntil,
                          removeUntilPredicate: (route) {
                            return false;
                          },
                        );
                      }else if (state.user!.profile == null || state.user!.profile!.id == null) {
                        Routes.seafarer.navigate(
                          CompleteRegisterPage.kRouteName,
                          navigationType: NavigationType.pushAndRemoveUntil,
                          removeUntilPredicate: (route) {
                            return false;
                          },
                        );
                      }else{
                        Routes.seafarer.navigate(
                          DashboardPage.kRouteName,
                          navigationType: NavigationType.pushAndRemoveUntil,
                          removeUntilPredicate: (route) {
                            return false;
                          },
                        );
                      }
                    },
                    orElse: () {},
                  );
                },
                loadingFailed: (failure) {
                  if (failure == AuthFailure.expiredJwt() || failure == AuthFailure.unauthorized()) {
                    showDialog(
                      context: Routes.seafarer.navigatorKey!.currentContext!,
                      builder: (context) {
                        return JwtExpiredDialog();
                      },
                    ).then((value) {
                      _authBloc.add(AuthEvent.logout());
                      Routes.seafarer.navigate(
                        RegisterPage.kRouteName,
                        navigationType: NavigationType.pushAndRemoveUntil,
                        removeUntilPredicate: (route) => false,
                      );
                    });
                  }
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