import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/enums/currency.type.dart';
import 'package:foodyn_rest/core/models/plan_model.dart';
import 'package:foodyn_rest/core/utils/color_utils.dart';
import 'package:foodyn_rest/core/utils/currency_utils.dart';
import 'package:foodyn_rest/core/utils/lang.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/auth/presentation/pages/plan_page.dart';
import 'package:velocity_x/velocity_x.dart';

class PlanItemWidget extends StatefulWidget {
  final List<PlanModel> list;
  final int selected;

  const PlanItemWidget({Key? key, required this.list, this.selected = 0})
      : super(key: key);

  @override
  _PlanItemWidgetState createState() => _PlanItemWidgetState();
}

class _PlanItemWidgetState extends State<PlanItemWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Routes.seafarer.navigate(PlanPage.kRouteName, params: {
        "plan": widget.list[widget.selected],
      }),
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorUtils(widget.list[widget.selected].primaryColor!).toColor(),
                  ColorUtils(widget.list[widget.selected].accentColor!).toColor(),
                ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.list[widget.selected].title!.text.xl2
                    .color(GlobalTheme.kAccentColor)
                    .bold
                    .make(),
                (widget.list[widget.selected].recommended!)
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.list[widget.selected].monthPrice
                    .toString()
                    .text
                    .size(Vx.dp64)
                    .color(GlobalTheme.kAccentColor)
                    .make(),
                SizedBox(
                  width: 5,
                ),
                (CurrencyUtils.toStringCurrency(CurrencyType
                            .values[widget.list[widget.selected].currency!]) +
                        "/" +
                        "Month")
                    .text
                    .color(GlobalTheme.kAccentColor)
                    .make(),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Text(widget.list[widget.selected].description!,
                  textAlign: isAr() ? TextAlign.right : TextAlign.left,
                  style: TextStyle(color: GlobalTheme.kAccentColor)),
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Click for more details",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: GlobalTheme.kAccentColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
