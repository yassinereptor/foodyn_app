import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/utils/lang.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/welcome/data/models/plan_model.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/app_bar_widget.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/splash/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import 'choose_payment_page.dart';
import 'learnmore_page.dart';
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

class _PlanPageState extends State<PlanPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: widget.plan.colors)),
        child: Column(
            children: [
              AppBarWidget(logout: true, color: GlobalTheme.kAccentColor),
              SizedBox(
                        height: 10,
                      ),
              SingleChildScrollView(
                child: Container(
                    child: Column(
                      children: [
                      
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widget.plan.title.text.xl4
                                .color(GlobalTheme.kAccentColor)
                                .bold
                                .make(),
                            (widget.plan.recommended)
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: "Recommended"
                                        .text
                                        .lg
                                        .uppercase
                                        .color(GlobalTheme.kAccentColor)
                                        .make(),
                                  )
                                : Container()
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widget.plan.price
                                .toString()
                                .text
                                .size(Vx.dp64)
                                .color(GlobalTheme.kAccentColor)
                                .make(),
                            SizedBox(
                              width: 5,
                            ),
                            (widget.plan.currency + "/" + "Month")
                                .text
                                .color(GlobalTheme.kAccentColor)
                                .make(),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (widget.plan.price * 12).toString()
                                .toString()
                                .text
                                .bold
                                .color(GlobalTheme.kAccentColor)
                                .make(),
                            SizedBox(
                              width: 5,
                            ),
                            (widget.plan.currency + "/" + "Year")
                                .text
                                .bold
                                .color(GlobalTheme.kAccentColor)
                                .make(),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(widget.plan.fulltext,
                            textAlign: isAr() ? TextAlign.right : TextAlign.left,
                            style: TextStyle(color: GlobalTheme.kAccentColor)),
                      ],
                    ),
                  ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: InkWell(
                  onTap: () {
                    Routes.seafarer.navigate(ChoosePaymentPage.kRouteName);
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
                          "Checkout".text.xl.color(widget.plan.colors[1]).make(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
      )
    ));
  }
}
