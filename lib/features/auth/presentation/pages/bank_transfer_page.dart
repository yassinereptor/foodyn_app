import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
import '../widgets/sliver_app_bar_widget.dart';
import '../widgets/resend_email_widget.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBarWidget(logout: true),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Container(
            child: Column(
              children: [
                ResendEmailWidget(),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 15),
                      child: "Bank Transfer".text.xl2.make(),
                    ),
                  ],
                ),
                Text("""
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
                style: TextStyle(
                ),),
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
            ),
          ),
        ),
      ),
          )
        ])));
  }
}
