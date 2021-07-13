import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:velocity_x/velocity_x.dart';

class ResendEmailWidget extends StatefulWidget {
  const ResendEmailWidget({Key? key}) : super(key: key);

  @override
  _ResendEmailWidgetState createState() => _ResendEmailWidgetState();
}

class _ResendEmailWidgetState extends State<ResendEmailWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDark(context) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You need to verify your email in order to use your account. if you didn't get a verification email", textAlign: TextAlign.center,),
          GestureDetector(
            onTap: (){},
            child: Text("Resend email", textAlign: TextAlign.center, style: TextStyle(color: GlobalTheme.kOrangeColor),))
        ],
      ),
    );
  }
}
