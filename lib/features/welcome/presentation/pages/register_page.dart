import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/splash/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import 'complete_register_page.dart';
import 'learnmore_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  static const kRouteName = "/register";

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Spacer(),
                Hero(
                  tag: "splash_logo",
                  child: Image.asset(
                    isDark(context)
                        ? "assets/logos/foodyn_vertical_light_logo.png"
                        : "assets/logos/foodyn_vertical_dark_logo.png",
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextFormWidget(
                          onChanged: (_){},
                          hint: "Email",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '● Please enter some text';
                            }
                            return null;
                          },
                        ) 
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: PasswordTextFormWidget()
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
                          Routes.seafarer.navigate(CompleteRegisterPage.kRouteName);

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
                                "Register"
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
                      SizedBox(
                        height: 20,
                      ),
                      "Already have an account".text.xl.make(),
                      InkWell(
                        onTap: () => Routes.seafarer.navigate(LoginPage.kRouteName),
                        child: "Log in".text.xl.color(GlobalTheme.kOrangeColor).make(),
                      )
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                    onTap: () => Routes.seafarer.navigate(LearnmorePage.kRouteName),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            "Learn More".text.xl.color(GlobalTheme.kOrangeColor).make(),
                            RotatedBox(
                                quarterTurns: 3,
                                child: Icon(Icons.arrow_back_ios)),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
