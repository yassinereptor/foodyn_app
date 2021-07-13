import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/app_bar_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/resend_email_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/splash/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:awesome_card/awesome_card.dart';
import 'choose_plan_page.dart';
import 'learnmore_page.dart';
import 'login_page.dart';

class BankCardPage extends StatefulWidget {
  static const kRouteName = "/bank-card";

  const BankCardPage({Key? key}) : super(key: key);

  @override
  _BankCardPageState createState() => _BankCardPageState();
}

class _BankCardPageState extends State<BankCardPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController CVVController = TextEditingController();
  bool _showBackSide = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(),
          child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        AppBarWidget(logout: true),
                    SizedBox(
                      height: 10,
                    ),
                    ResendEmailWidget(),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 15),
                          child: "Fill your card information".text.xl2.make(),
                        ),
                      ],
                    ),
                      ],
                    ),
                  ),
                  Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: CreditCard(
                              cardNumber: cardNumberController.text,
                              cardExpiry: expireDateController.text,
                              cardHolderName: fullnameController.text,
                              cvv: CVVController.text,
                              bankName: "Bank Card",
                              // cardType: CardType.masterCard, // Optional if you want to override Card Type
                              showBackSide: _showBackSide,
                              frontBackground: CardBackgrounds.black,
                              backBackground: CardBackgrounds.white,
                              showShadow: true,
                              textExpDate: 'Exp. Date',
                              textName: 'Name',
                              textExpiry: 'MM/YY'
                            ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: TextFormWidget(
                                onChanged: (value){
                                        setState((){
                                          _showBackSide = false;
                                        });
                                      },
                                controller: fullnameController,
                                hint: "Full name",
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '● Please enter some text';
                                  }
                                  return null;
                                },
                              )),
                          Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: TextFormWidget(
                                onChanged: (value){
                                        setState((){
                                          _showBackSide = false;
                                        });
                                      },
                                controller: cardNumberController,
                                hint: "Card Number",
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '● Please enter some text';
                                  }
                                  return null;
                                },
                              )),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: TextFormWidget(
                                      onChanged: (value){
                                        setState((){
                                          _showBackSide = false;
                                        });
                                      },
                                      controller: expireDateController,
                                      hint: "MM/YY",
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '● Please enter some text';
                                        }
                                        return null;
                                      },
                                    )),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: TextFormWidget(
                                      onChanged: (value){
                                        setState((){
                                          _showBackSide = true;
                                        });
                                      },
                                      controller: CVVController,
                                      hint: "CVV",
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '● Please enter some text';
                                        }
                                        return null;
                                      },
                                    )),
                              ),
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(content: Text('Processing Data')));
                                }
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
                                      "Diposit"
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
                ],
              ),
            ),
        ),
      ),
    ));
  }
}
