import 'package:flutter/material.dart';
import 'package:foodyn_rest/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:foodyn_rest/features/welcome/data/models/plan_model.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/bank_card_page.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/bank_transfer_page.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/choose_payment_page.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/choose_plan_page.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/complete_register_page.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/learnmore_page.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/login_page.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/plan_page.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/register_page.dart';

import 'package:foodyn_rest/features/intro/presentation/pages/intro_page.dart';

import '../../../features/languages/presentation/pages/languages_page.dart';
import '../../../features/splash/presentation/pages/splash_page.dart';
import 'package:seafarer/seafarer.dart';

class Routes {
  static final seafarer = Seafarer();

  static void createRoutes() {
 
    seafarer.addRoute(SeafarerRoute(
      name: SplashPage.kRouteName,
      builder: (context, args, paramMap) => SplashPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: LanguagesPage.kRouteName,
      defaultTransitions: [
        SeafarerTransition.slide_from_right,
      ],
      params: [
        SeafarerParam<bool>(name: "firstTime", defaultValue: true),
      ],
      builder: (context, args, params) {
        return LanguagesPage(firstTime: params.param("firstTime"),);
      },
    ));

    seafarer.addRoute(SeafarerRoute(
      name: IntroPage.kRouteName,
      defaultTransitions: [
        SeafarerTransition.slide_from_right,
      ],
      builder: (context, args, params) {
        return IntroPage();
      },
    ));

    seafarer.addRoute(SeafarerRoute(
      name: RegisterPage.kRouteName,
      defaultTransitions: [
        SeafarerTransition.fade_in,
      ],
      builder: (context, args, paramMap) => RegisterPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: LoginPage.kRouteName,
      defaultTransitions: [
        SeafarerTransition.fade_in,
      ],
      builder: (context, args, paramMap) => LoginPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: LearnmorePage.kRouteName,
      defaultTransitions: [
        SeafarerTransition.slide_from_bottom
      ],
      builder: (context, args, paramMap) => LearnmorePage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: CompleteRegisterPage.kRouteName,
      builder: (context, args, paramMap) => CompleteRegisterPage(),
    ));
    
    seafarer.addRoute(SeafarerRoute(
      name: ChoosePlanPage.kRouteName,
      builder: (context, args, paramMap) => ChoosePlanPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: ChoosePaymentPage.kRouteName,
      builder: (context, args, paramMap) => ChoosePaymentPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: BankTransferPage.kRouteName,
      builder: (context, args, paramMap) => BankTransferPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: BankCardPage.kRouteName,
      builder: (context, args, paramMap) => BankCardPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: PlanPage.kRouteName,
      params: [
        SeafarerParam<PlanModel>(name: "plan"),
      ],
      builder: (context, args, params) {
        return PlanPage(
          plan: params.param("plan"),
        );
      },
    ));

    seafarer.addRoute(SeafarerRoute(
      name: DashboardPage.kRouteName,
      builder: (context, args, paramMap) => DashboardPage(),
    ));
  }
}
