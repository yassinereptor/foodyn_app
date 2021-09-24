import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/models/plan_model.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/utils/color_utils.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/bloc/auth_bloc/auth_bloc.dart';
import '../pages/plan_page.dart';
import 'package:velocity_x/velocity_x.dart';

class PlanItemWidget extends StatefulWidget {
  final PlanModel plan;

  const PlanItemWidget({Key? key, required this.plan})
      : super(key: key);

  @override
  _PlanItemWidgetState createState() => _PlanItemWidgetState();
}

class _PlanItemWidgetState extends State<PlanItemWidget> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late AuthBloc _authBloc;
  late String? _calcYearPrice;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    animation = Tween<double>(begin: -10, end: 40).animate(new CurvedAnimation(
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
    _calcYearPrice = CurrencyUtils(widget.plan).getCalcYearPrice();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => _authBloc,
      child: InkWell(
          onTap: () => Routes.seafarer.navigate(PlanPage.kRouteName, params: {
            "plan": widget.plan,
          }),
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
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
                          width: 200,
                          height: 200,
                        ),
                      ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        ColorUtils(widget.plan.primaryColor!).toColor().withOpacity(0.9),
                        ColorUtils(widget.plan.accentColor!).toColor(),
                      ])),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          StringUtils.getTranslatedString(_authBloc.state.locale!, widget.plan.title!).text.bold.capitalize.xl2.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                          Spacer(),
                          IconButton(onPressed: (){},
                          padding: EdgeInsets.zero,
    constraints: BoxConstraints(),
                           icon: Icon(Icons.monetization_on), color: ColorUtils(widget.plan.textColor!).toColor())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CurrencyUtils(widget.plan).getMonthPrice().text.light.xl5.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
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
                          _calcYearPrice!.text.lg.light.color(ColorUtils(widget.plan.textColor!).toColor()).lineThrough.make(),
                          if (_calcYearPrice != null)
                          SizedBox(width: 5,),
                          CurrencyUtils(widget.plan).getYearPrice().text.bold.lg.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                          SizedBox(width: 5,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: CurrencyUtils.toStringCurrency().text.bold.sm.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                          ),
                        ],
                      ),
                      "Per Year".text.bold.sm.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                      SizedBox(height: 10,),
                      StringUtils.getTranslatedString(_authBloc.state.locale!, widget.plan.description!).text.bold.sm.color(ColorUtils(widget.plan.textColor!).toColor()).overflow(TextOverflow.ellipsis).make(),
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            child: "Learn More".text.color(ColorUtils(widget.plan.textColor!).toColor()).make(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
    );
  }
}
