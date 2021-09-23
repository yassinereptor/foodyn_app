import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/data/models/plan_model.dart';
import 'package:foodyn_rest/core/domain/entities/auth_failure.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/utils/color_utils.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
import '../../../../core/bloc/setting_bloc/setting_bloc.dart';
import 'payment_page.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import 'package:seafarer/seafarer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math' as math;

import 'login_page.dart';

class PlanPage extends StatefulWidget {
  static const kRouteName = "/plan";

  final PlanModel plan;

  const PlanPage(
      {Key? key,
      required this.plan})
      : super(key: key);

  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> with SingleTickerProviderStateMixin {
  late SettingBloc _settingBloc;
  late AuthBloc _authBloc;
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;
late String? _calcYearPrice;
late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    animation = Tween<double>(begin: 200, end: 400).animate(new CurvedAnimation(
  parent: controller,
  curve: Curves.easeInOutCubic
))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
    _authBloc = context.read<AuthBloc>();
    _settingBloc = getIt<SettingBloc>();
    _calcYearPrice = CurrencyUtils(widget.plan).getCalcYearPrice();
  }

  @override
  void dispose() {
    _settingBloc.close();
    super.dispose();
  }

  void _onTypeloadingInProgress () {
    
  }

  void _onTypeloadingPlansSuccess (List<PlanModel>? plans) {
    setState(() {
        _modalType = ModalContainerType.SUCCESS;
    });
      Future.delayed(Duration(milliseconds: 2000), () {
        setState(() {
          _showModal = false;
          _modalType = ModalContainerType.LOADING;
        });
    });
    
  }

  void _onTypeloadingFailure (AuthFailure failure) {
    setState(() {
      _modalType = ModalContainerType.FAILURE;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _showModal = false;
        _modalType = ModalContainerType.LOADING;
      });
    });
  }

  void _modalReset() {
    setState(() {
      _showModal = false;
      _modalType = ModalContainerType.LOADING;
    });
  }

  void _onLogout() {
    _authBloc.add(AuthEvent.logout());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _settingBloc
          ),
          BlocProvider(
          create: (context) => _authBloc
          )
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                state.type.maybeWhen(
                  loadingFailed: (AuthFailure message) {
                    message.maybeWhen(
                        storage: () {
                          final snackBar =
                              SnackBar(content: Text("Can't loged out"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        orElse: () {});
                  },
                  logedOut: () {
                    Routes.seafarer.navigate(
                      LoginPage.kRouteName,
                      navigationType: NavigationType.pushAndRemoveUntil,
                      removeUntilPredicate: (route) => false,
                    );
                  },
                  orElse: () {});
              },
            ),
            BlocListener<SettingBloc, SettingState>(
              listener: (context, state) {
                state.maybeWhen(
                  loadingInProgress: _onTypeloadingInProgress,
                  loadingPlansSuccess: _onTypeloadingPlansSuccess,
                  loadingFailed: _onTypeloadingFailure,
                  orElse: (){});
              },
            )
          ],
          child: Scaffold(
            body: ModalContainerWidget(
              onLoading: _modalReset,
              onSucceed: _modalReset,
              onFailed: _modalReset,
              child: Stack(
                children: [
                  Container(
                  child: Positioned(
                    right: 0,
                    top: animation.value,
                    child: Transform.rotate(
                      angle: -math.pi / 10,
                      child: Image.asset(
                          isDark(context)? "assets/logos/foodyn_shape_light_logo.png" : "assets/logos/foodyn_shape_dark_logo.png",
                          fit: BoxFit.contain,
                          colorBlendMode: BlendMode.multiply,
                          width: 400,
                          height: 400,
                        ),
                      ),
                  ),
                ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            ColorUtils(widget.plan.primaryColor!).toColor().withOpacity(0.9),
                            ColorUtils(widget.plan.accentColor!).toColor(),
                    ])),
                    child: SafeArea(
                      child: CustomScrollView(
                        shrinkWrap: false,
                        slivers: [
                          SliverAppBar(
                            backgroundColor: Colors.transparent,
                            pinned: false,
                            snap: false,
                            floating: false,
                            automaticallyImplyLeading: false,
                            flexibleSpace: Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: FocusTraversalGroup(
                                policy: OrderedTraversalPolicy(),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => Routes.seafarer.pop(),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Icon(
                                                      Icons.arrow_back_ios,
                                                      color: ColorUtils(widget.plan.textColor!).toColor(),
                                                    ),
                                            ),
                                            "Back".text.xl.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                              onTap: _onLogout,
                                              child: "Log out"
                                                  .text
                                                  .xl
                                                  .color(ColorUtils(widget.plan.textColor!).toColor())
                                                  .make(),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 5, bottom: 15),
                                      child: Row(
                                        children: [
                                          StringUtils.getTranslatedString(_authBloc.state.locale!, widget.plan.title!).text.bold.capitalize.xl2.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                                          Spacer(),
                                          IconButton(onPressed: (){},
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          icon: Icon(Icons.monetization_on), color: ColorUtils(widget.plan.textColor!).toColor())
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        CurrencyUtils(widget.plan).getMonthPrice().text.light.xl6.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                                        SizedBox(width: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 16),
                                          child: CurrencyUtils.toStringCurrency().text.bold.xl.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                                        ),
                                      ],
                                    ),
                                    "Per Month".text.bold.xl.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        if (_calcYearPrice != null)
                                        _calcYearPrice!.text.xl3.light.color(ColorUtils(widget.plan.textColor!).toColor()).lineThrough.make(),
                                        if (_calcYearPrice != null)
                                        SizedBox(width: 10,),
                                        CurrencyUtils(widget.plan).getYearPrice().text.bold.xl3.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                                        SizedBox(width: 5,),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 4),
                                          child: CurrencyUtils.toStringCurrency().text.xl.bold.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                                        ),
                                      ],
                                    ),
                                    "Per Year".text.xl.bold.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                                    SizedBox(height: 30,),
                                    StringUtils.getTranslatedString(_authBloc.state.locale!, widget.plan.description!).text.bold.sm.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                                    SizedBox(height: 20,),
                                    
                                    Padding(
                                      padding: EdgeInsets.only(top: 10, bottom: 20),
                                      child: InkWell(
                                        onTap: () {
                                          Routes.seafarer.navigate(PaymentPage.kRouteName, params: {
                                            "plan": widget.plan,
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: GlobalTheme.kAccentColor,
                                              borderRadius: BorderRadius.circular(10)),
                                          padding: Vx.mH32,
                                          height: 65.0,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                "Checkout".text.xl.color(ColorUtils(widget.plan.accentColor!).toColor()).make(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
