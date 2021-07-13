import 'dart:convert';
import 'dart:ui';

import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/app_bar_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/bottom_sheet_container_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/bottom_sheet_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/dropdown_form_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/resend_email_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/splash/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import 'choose_plan_page.dart';
import 'learnmore_page.dart';
import 'login_page.dart';

class CompleteRegisterPage extends StatefulWidget {
  static const kRouteName = "/complete-register";

  const CompleteRegisterPage({Key? key}) : super(key: key);

  @override
  _CompleteRegisterPageState createState() => _CompleteRegisterPageState();
}

class _CompleteRegisterPageState extends State<CompleteRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  int _defaultDialCodeIndex = 0;
  List<String> _phoneCodes = ['{"name": "Morocco","dial_code": "+212","code": "MA"}'];
  ScrollController? scrollController = new ScrollController();

  @override
  void initState() {
    DefaultAssetBundle.of(context)
        .loadString("assets/raw/phone.json")
        .then((value) {
      final jsonResult = json.decode(value);
      setState(() {
        _phoneCodes = [
          ...jsonResult.map((item) => json.encode(item))
        ];
        _defaultDialCodeIndex = 145;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
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
                      child: "Complete your registration".text.xl2.make(),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormWidget(
                            onChanged: (_) {},
                            hint: "Full name",
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '● Please enter some text';
                              }
                              return null;
                            },
                          )),
                      Row(
                        children: [
                          Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            child: Text("data"),
                            onTap: (){
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                              ),
                              builder: (BuildContext context) {
                                return Container();
                              });
                          },)
                          // BottomSheetWidget(
                          //   drawerController: drawerController,
                          //   dropArrowController: dropArrowController,
                          //   bottomDrawerVisible: bottomDrawerVisible,
                          //   kFlingVelocity: kFlingVelocity,
                          //   child: DropdownFormWidget(
                          //     onSelect: (value) {},
                          //     list: _phoneCodes,
                          //     defaultIndex: _defaultDialCodeIndex,
                          //     modifyListOutput: (text) {
                          //       return text;
                          //     },
                          //     modifySelectedOutput: (text) {
                          //       final jsonResult = json.decode(text);
                          //       return jsonResult["code"] + " (" + jsonResult["dial_code"] + ")";
                          //     },
                          //   )
                          // )
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: TextFormWidget(
                                  onChanged: (_) {},
                                  hint: "Phone number",
                                  keyboardType: TextInputType.phone,
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
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormWidget(
                            onChanged: (_) {},
                            hint: "Adresse",
                            keyboardType: TextInputType.streetAddress,
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
                                  onChanged: (_) {},
                                  hint: "City",
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '● Please enter some text';
                                    }
                                    return null;
                                  },
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: TextFormWidget(
                                  onChanged: (_) {},
                                  hint: "Country",
                                  keyboardType: TextInputType.text,
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
                          Routes.seafarer.navigate(ChoosePlanPage.kRouteName);
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
                                "Choose plan"
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
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
