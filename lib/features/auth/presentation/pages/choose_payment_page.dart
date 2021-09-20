import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/auth/data/models/payment_model.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/sliver_app_bar_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/plan_item_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/resend_email_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bank_card_page.dart';
import 'bank_transfer_page.dart';
import 'learnmore_page.dart';
import 'login_page.dart';

class ChoosePaymentPage extends StatefulWidget {
  static const kRouteName = "/choose-payment";

  const ChoosePaymentPage({Key? key}) : super(key: key);

  @override
  _ChoosePaymentPageState createState() => _ChoosePaymentPageState();
}

class _ChoosePaymentPageState extends State<ChoosePaymentPage> {
  final _formKey = GlobalKey<FormState>();
  List<PaymentModel> listPaymentModel = [
    new PaymentModel(
        title: "Bank Transfrer",
        asset: "assets/icons/transfer.png",
        colors: [GlobalTheme.kTransferColor, GlobalTheme.kAccentColor],
        onTap: () => Routes.seafarer.navigate(BankTransferPage.kRouteName)),
    new PaymentModel(
        title: "Bank Card",
        asset: "assets/icons/card.png",
        exist: true,
        colors: [GlobalTheme.kCardColor, GlobalTheme.kAccentColor],
        onTap: () => Routes.seafarer.navigate(BankCardPage.kRouteName)),
    new PaymentModel(
        title: "Paypal",
        asset: "assets/icons/paypal.png",
        exist: false,
        colors: [GlobalTheme.kPaypalColor, GlobalTheme.kAccentColor],
        onTap: () {}),
    new PaymentModel(
        title: "GooglePay",
        asset: "assets/icons/google.png",
        exist: false,
        colors: [GlobalTheme.kAccentDarkColor, GlobalTheme.kPrimaryColor],
        onTap: () => Routes.seafarer.navigate(BankCardPage.kRouteName)),
    new PaymentModel(
        title: "ApplePay",
        asset: "assets/icons/apple.png",
        exist: false,
        colors: [GlobalTheme.kApplePayColor, GlobalTheme.kAccentColor],
        onTap: () => Routes.seafarer.navigate(BankCardPage.kRouteName)),
  ];

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
            child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 15),
                        child: "Choose a method of payment".text.xl2.make(),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          ...listPaymentModel.mapIndexed((payment, index) =>
                          Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: InkWell(
                  onTap: (payment.exist) ? payment.onTap : () {
                    //Bottom message
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: payment.colors[0],
                        borderRadius: BorderRadius.circular(10)),
                    padding: Vx.mH32,
                    height: 65.0,
                    child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Image.asset(payment.asset, width: 40, height: 40,),
                          ),
                          (payment.exist) ? payment.title.text.xl.color(payment.colors[1]).make() : payment.title.text.xl.color(payment.colors[1]).lineThrough.make(),
                          (payment.exist) ? Container() : " (Soon)".text.xl.color(payment.colors[1]).make(),
                        ],
                      ),
                  ),
                ),
              ),)
              
                        ],
                      ),
                    ),
                  )
                  ],
              ),
            ),
          ),),
        ])));

  }
}
