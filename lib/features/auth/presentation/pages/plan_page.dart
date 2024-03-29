import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/currency_button_widget.dart';
import '../../../../core/bloc/config_bloc/config_bloc.dart';
import '../../../../core/data/models/plan_model.dart';
import '../../../../core/domain/entities/app_failure.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/utils/color_utils.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/modal_container_widget.dart';
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

  const PlanPage({Key? key, required this.plan}) : super(key: key);

  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage>
    with SingleTickerProviderStateMixin {
  late ConfigBloc _configBloc;
  late AuthBloc _authBloc;
  bool _showModal = false;
  ModalContainerType _modalType = ModalContainerType.LOADING;
  late String? _calcYearPrice;
  late Animation<double> animation;
  late AnimationController controller;
  int? _selectedCurrencyIndex;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    animation = Tween<double>(begin: 200, end: 400).animate(
        new CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic))
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
    CurrencyUtils.getCurrencyIndex().then((value) => _selectedCurrencyIndex = value);
    controller.forward();
    _authBloc = context.read<AuthBloc>();
    _configBloc = context.read<ConfigBloc>();
    _calcYearPrice = CurrencyUtils(widget.plan).getCalcYearPrice();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onStateLoadingInProgress() {
    setState(() {
      _showModal = true;
      _modalType = ModalContainerType.LOADING;
    });
  }

  void _onStateLoadingSuccess() {
    setState(() {
      _modalType = ModalContainerType.SUCCESS;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      _onModalReset();
    });
  }

  void _onStateLoadingFailure(AppFailure failure) {
    setState(() {
      _modalType = ModalContainerType.FAILURE;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      _onModalReset();
    });
  }

  void _onModalReset() {
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
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.type.maybeWhen(
                loadingFailed: (AppFailure message) {
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
        BlocListener<ConfigBloc, ConfigState>(
          listener: (context, state) {
            state.type.maybeWhen(
                loadingInProgress: _onStateLoadingInProgress,
                loadingSuccess: _onStateLoadingSuccess,
                loadingFailed: _onStateLoadingFailure,
                orElse: () {});
          },
        )
      ],
      child: Scaffold(
        body: ModalContainerWidget(
          type: _modalType,
          show: _showModal,
          onReset: _onModalReset,
          child: Stack(
            children: [
              Container(
                child: Positioned(
                  right: 0,
                  top: animation.value,
                  child: Transform.rotate(
                    angle: -math.pi / 10,
                    child: Image.asset(
                      isDark(context)
                          ? "assets/logos/foodyn_shape_light_logo.png"
                          : "assets/logos/foodyn_shape_dark_logo.png",
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
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [
                      ColorUtils(widget.plan.primaryColor!).toColor(),
                      ColorUtils(widget.plan.accentColor!).toColor().withOpacity(0.9),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => Routes.seafarer.pop(),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10),
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            color: ColorUtils(
                                                    widget.plan.textColor!)
                                                .toColor(),
                                          ),
                                        ),
                                        "Back"
                                            .text
                                            .xl
                                            .color(ColorUtils(
                                                    widget.plan.textColor!)
                                                .toColor())
                                            .make(),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: _onLogout,
                                    child: "Log out"
                                        .text
                                        .xl
                                        .color(
                                            ColorUtils(widget.plan.textColor!)
                                                .toColor())
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
                                  padding:
                                      EdgeInsets.only(top: 5, bottom: 15),
                                  child: Row(
                                    children: [
                                      StringUtils.getTranslatedString(
                                              _configBloc.state.locale!,
                                              widget.plan.title!)
                                          .text
                                          .bold
                                          .capitalize
                                          .xl2
                                          .color(ColorUtils(
                                                  widget.plan.textColor!)
                                              .toColor())
                                          .make(),
                                      Spacer(),
                                      CurrencyButtonWidget(
                                        color: ColorUtils(widget.plan.textColor!).toColor(),
                                        onSelect: (index) => setState(() {
                                          _selectedCurrencyIndex = index;
                                        }),
                                        plan: widget.plan,
                                        modifyListOutput: (text) => text.toUpperCase()
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CurrencyUtils(widget.plan)
                                        .getMonthPrice()
                                        .text
                                        .light
                                        .xl6
                                        .color(
                                            ColorUtils(widget.plan.textColor!)
                                                .toColor())
                                        .make(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: CurrencyUtils.toStringCurrency(_selectedCurrencyIndex)
                                          .text
                                          .bold
                                          .xl
                                          .color(ColorUtils(
                                                  widget.plan.textColor!)
                                              .toColor())
                                          .make(),
                                    ),
                                  ],
                                ),
                                "Per Month"
                                    .text
                                    .bold
                                    .xl
                                    .color(ColorUtils(widget.plan.textColor!)
                                        .toColor())
                                    .make(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (_calcYearPrice != null)
                                      _calcYearPrice!.text.xl3.light
                                          .color(ColorUtils(
                                                  widget.plan.textColor!)
                                              .toColor())
                                          .lineThrough
                                          .make(),
                                    if (_calcYearPrice != null)
                                      SizedBox(
                                        width: 10,
                                      ),
                                    CurrencyUtils(widget.plan)
                                        .getYearPrice()
                                        .text
                                        .bold
                                        .xl3
                                        .color(
                                            ColorUtils(widget.plan.textColor!)
                                                .toColor())
                                        .make(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4),
                                      child: CurrencyUtils.toStringCurrency(_selectedCurrencyIndex)
                                          .text
                                          .xl
                                          .bold
                                          .color(ColorUtils(
                                                  widget.plan.textColor!)
                                              .toColor())
                                          .make(),
                                    ),
                                  ],
                                ),
                                "Per Year"
                                    .text
                                    .xl
                                    .bold
                                    .color(ColorUtils(widget.plan.textColor!)
                                        .toColor())
                                    .make(),
                                SizedBox(
                                  height: 30,
                                ),
                                StringUtils.getTranslatedString(
                                        _configBloc.state.locale!,
                                        widget.plan.description!)
                                    .text
                                    .bold
                                    .sm
                                    .color(ColorUtils(widget.plan.textColor!)
                                        .toColor())
                                    .make(),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10, bottom: 20),
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
                                        height: 65.0,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            "Checkout".text.xl.color(ColorUtils(widget.plan.primaryColor!).toColor()).make(),
                                          ],
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
    );
  }
}
