import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class BankTransferPage extends StatefulWidget {
  static const kRouteName = "/bank-transfer";

  const BankTransferPage({Key? key}) : super(key: key);

  @override
  _BankTransferPageState createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldContainerWidget(
      logout: true,
      title: "Bank Transfer",
      children: [
        Text(
          """
You  can use one of this
choices to send us money
according to your plan

PREMIUM PLAN
999 MAD PER MONTH
11988 MAD PER YEAR

BANK RIB 
000 00 000000000000000 000

WESTERN UNION
00000000000000000

We will contact you
to confirm your checkout.
If you have any questions 
you can contact us on
WhatsApp +212 680105534
                """,
          textAlign: TextAlign.center,
          style: TextStyle(),
        ),
        InkWell(
          onTap: () {
            Routes.seafarer.navigate(DashboardPage.kRouteName);
          },
          child: Container(
            decoration: BoxDecoration(
                color: GlobalTheme.kOrangeColor,
                borderRadius: BorderRadius.circular(10)),
            padding: Vx.mH32,
            height: 65.0,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Continue"
                      .text
                      .xl
                      .color((isDark(context))
                          ? GlobalTheme.kPrimaryColor
                          : GlobalTheme.kAccentColor)
                      .make(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
