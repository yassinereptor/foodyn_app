import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/welcome/data/models/plan_model.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/app_bar_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/plan_item_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/resend_email_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/splash/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import 'learnmore_page.dart';
import 'login_page.dart';

class ChoosePlanPage extends StatefulWidget {
  static const kRouteName = "/choose-plan";

  const ChoosePlanPage({Key? key}) : super(key: key);

  @override
  _ChoosePlanPageState createState() => _ChoosePlanPageState();
}

class _ChoosePlanPageState extends State<ChoosePlanPage> {
  final _formKey = GlobalKey<FormState>();
  int selected = 0;
  List<PlanModel> listPlanModel = [
    new PlanModel(
      title: "Premium Plan",
      price: 999,
      currency: "MAD",
      text: """
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
          """,
      fulltext: """
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
          """,
      colors: [GlobalTheme.kGradient3Color1, GlobalTheme.kGradient3Color2],
      recommended: true,
    ),
    PlanModel(
      title: "Essential Plan",
      price: 499,
      currency: "MAD",
      text: """
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
          """,
      fulltext: """
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
          """,
      colors: [GlobalTheme.kGradient2Color1, GlobalTheme.kGradient2Color2],
    ),
    PlanModel(
      title: "Free Plan",
      price: 0,
      currency: "MAD",
      text: """
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
          """,
      fulltext: """
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
- Lorem ipsum dolor sit amet consectetur
adipiscing elit
          """,
      colors: [GlobalTheme.kGradient1Color1, GlobalTheme.kGradient1Color2],
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                child: Column(
                  children: [
                    AppBarWidget(logout: true),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 15),
                          child: "Choose a plan".text.xl2.make(),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Swiper(
                        onIndexChanged: (index){
                          setState(() {
                            selected = index;
                          });
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return PlanItemWidget(list: listPlanModel, selected: index);
                        },
                        itemCount: listPlanModel.length,
                        viewportFraction: 0.8,
                        scale: 0.9,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...listPlanModel.mapIndexed((currentValue, index) => Container(
                            margin: EdgeInsets.only(left: 5, right: 5, bottom: 12.5),
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (selected == index)? listPlanModel[selected].colors[1] : GlobalTheme.kPrimaryLightColor.withOpacity(.3),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),));
  }
}
