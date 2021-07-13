import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:velocity_x/velocity_x.dart';

class CardViewWidget extends StatefulWidget {
  final String fullname;
  final String cardNumber;
  final String expireDate;
  final String CCV;

  const CardViewWidget({Key? key,
    required this.fullname,
    required this.cardNumber,
    required this.expireDate,
    required this.CCV,
  }) : super(key: key);

  @override
  _CardViewWidgetState createState() => _CardViewWidgetState();
}

class _CardViewWidgetState extends State<CardViewWidget> {
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
          
        ],
      ),
    );
  }
}
