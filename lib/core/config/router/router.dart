import 'package:foodyn_eatery/core/data/models/eatery_model.dart';
import 'package:foodyn_eatery/core/data/models/image_model.dart';
import 'package:foodyn_eatery/core/data/models/table_model.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/add_category_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/add_group_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/add_eatery_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/add_user_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/category_icon_package_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/category_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/eatery_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/food_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/image_view_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/interactive_tables_map_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/menu_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/profile_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/qr_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/qr_preset_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/qr_scanner_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/settings_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/show_all_eateries_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/tables_map_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/version_page.dart';

import '../../data/models/coupon_model.dart';
import '../../data/models/plan_model.dart';

import '../../../features/auth/presentation/pages/payment_page.dart';
import '../../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../../features/auth/presentation/pages/bank_card_page.dart';
import '../../../features/auth/presentation/pages/bank_transfer_page.dart';
import '../../../features/auth/presentation/pages/choose_payment_page.dart';
import '../../../features/auth/presentation/pages/choose_plan_page.dart';
import '../../../features/auth/presentation/pages/complete_register_page.dart';
import '../../../features/auth/presentation/pages/forget_password_page.dart';
import '../../../features/auth/presentation/pages/geolocation_page.dart';
import '../../../features/auth/presentation/pages/learnmore_page.dart';
import '../../../features/auth/presentation/pages/login_page.dart';
import '../../../features/auth/presentation/pages/plan_page.dart';
import '../../../features/auth/presentation/pages/register_image_page.dart';
import '../../../features/auth/presentation/pages/register_page.dart';

import '../../../features/intro/presentation/pages/intro_page.dart';
import '../../../features/auth/presentation/pages/verify_otp_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      params: [
        SeafarerParam<bool>(name: "back", defaultValue: true),
      ],
      builder: (context, args, params) => ChoosePlanPage(
        back: params.param("back"),
      ),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: ChoosePaymentPage.kRouteName,
      params: [
        SeafarerParam<PlanModel>(name: "plan"),
        SeafarerParam<CouponModel?>(name: "coupon"),
      ],
      builder: (context, args, params) {
        return ChoosePaymentPage(
          plan: params.param("plan"),
          coupon: params.param("coupon"),
        );
      },
    ));

    seafarer.addRoute(SeafarerRoute(
      name: PaymentPage.kRouteName,
      params: [
        SeafarerParam<PlanModel>(name: "plan"),
      ],
      builder: (context, args, params) {
        return PaymentPage(
          plan: params.param("plan"),
        );
      },
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
      name: GeolocationPage.kRouteName,
      params: [
        SeafarerParam<LatLng>(name: "latLng")
      ],
      builder: (context, args, params) => GeolocationPage(
        latLng: params.param("latLng"),
      ),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: ForgetPasswordPage.kRouteName,
      builder: (context, args, paramMap) => ForgetPasswordPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: VerifyOtpPage.kRouteName,
      params: [
        SeafarerParam<String>(name: "title"),
        SeafarerParam<bool>(name: "logout"),
        SeafarerParam<void Function()>(name: "onSuccess"),
        SeafarerParam<void Function(String?)>(name: "onError"),
      ],
      builder: (context, args, params) => VerifyOtpPage(
        title: params.param("title"),
        logout: params.param("logout"),
        onSuccess: params.param("onSuccess"),
        onError: params.param("onError"),
      ),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: RegisterImagePage.kRouteName,
      builder: (context, args, paramMap) => RegisterImagePage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: DashboardPage.kRouteName,
      builder: (context, args, paramMap) => DashboardPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: ProfilePage.kRouteName,
      builder: (context, args, paramMap) => ProfilePage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: SettingsPage.kRouteName,
      builder: (context, args, paramMap) => SettingsPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: VersionPage.kRouteName,
      builder: (context, args, paramMap) => VersionPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: AddEateryPage.kRouteName,
      builder: (context, args, paramMap) => AddEateryPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: AddUserPage.kRouteName,
      builder: (context, args, paramMap) => AddUserPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: AddGroupPage.kRouteName,
      builder: (context, args, paramMap) => AddGroupPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: TablesMapPage.kRouteName,
      builder: (context, args, paramMap) => TablesMapPage(),
    ));
    
    seafarer.addRoute(SeafarerRoute(
      name: InteractiveTablesMapPage.kRouteName,
      params: [
        SeafarerParam<List<TableModel>>(name: "tableItemList"),
        SeafarerParam<int>(name: "rows"),
        SeafarerParam<int>(name: "columns"),
        SeafarerParam<int>(name: "tables"),
      ],
      builder: (context, args, params) => InteractiveTablesMapPage(
        tableItemList: params.param("tableItemList"),
        rows: params.param("rows"),
        columns: params.param("columns"),
        tables: params.param("tables"),
      ),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: ShowAllEateriesPage.kRouteName,
      builder: (context, args, paramMap) => ShowAllEateriesPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: EateryPage.kRouteName,
      params: [
        SeafarerParam<EateryModel>(name: "eateryModel"),
      ],
      builder: (context, args, params) => EateryPage(eateryModel: params.param("eateryModel")),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: ImageViewPage.kRouteName,
      params: [
        SeafarerParam<ImageModel>(name: "imageModel"),
      ],
      builder: (context, args, params) => ImageViewPage(imageModel: params.param("imageModel")),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: QrPage.kRouteName,
      builder: (context, args, paramMap) => QrPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: QrPresetPage.kRouteName,
      builder: (context, args, paramMap) => QrPresetPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: QrScannerPage.kRouteName,
      builder: (context, args, paramMap) => QrScannerPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: CategoryPage.kRouteName,
      builder: (context, args, paramMap) => CategoryPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: AddCategoryPage.kRouteName,
      builder: (context, args, paramMap) => AddCategoryPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: CategoryIconPackagePage.kRouteName,
      builder: (context, args, paramMap) => CategoryIconPackagePage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: MenuPage.kRouteName,
      builder: (context, args, paramMap) => MenuPage(),
    ));

    seafarer.addRoute(SeafarerRoute(
      name: FoodPage.kRouteName,
      builder: (context, args, paramMap) => FoodPage(),
    ));
    
  }
}
