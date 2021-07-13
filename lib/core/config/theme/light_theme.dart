import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'global_theme.dart';
import 'input_decoration_theme.dart';

final labelStyle = TextStyle(
  fontSize: Vx.dp16,
  fontWeight: FontWeight.w700,
  height: 0,
);

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(Vx.dp8),
  borderSide: BorderSide.none,
);

final errorStyle = TextStyle(
  height: Vx.dp1,
  fontWeight: FontWeight.w500,
);

final lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: GlobalTheme.kAccentColor,
    accentColor: GlobalTheme.kPrimaryColor,
    scaffoldBackgroundColor: GlobalTheme.kAccentColor,
    backgroundColor: GlobalTheme.kAccentColor,
    inputDecorationTheme: inputDecorationTheme,
    errorColor: Colors.redAccent.shade400,
    iconTheme: IconThemeData(color: GlobalTheme.kPrimaryColor),
    dividerColor: GlobalTheme.kOrangeColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: GlobalTheme.kPrimaryColor),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: GlobalTheme.kPoppinsFont,
          fontSize: 18.0,
        ),
      ),
    ),
    fontFamily: GlobalTheme.kPoppinsFont,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: GlobalTheme.kPrimaryColor,
      ),
      bodyText2: TextStyle(
        color: GlobalTheme.kPrimaryColor,
      ),
      headline1: TextStyle(
        color: GlobalTheme.kPrimaryColor,
      ),
      headline2: TextStyle(
        color: GlobalTheme.kPrimaryColor,
      ),
      headline3: TextStyle(
        color: GlobalTheme.kPrimaryColor,
      ),
      headline4: TextStyle(
        color: GlobalTheme.kPrimaryColor,
      ),
      headline5: TextStyle(
        color: GlobalTheme.kPrimaryColor,
      ),
      headline6: TextStyle(
        color: GlobalTheme.kPrimaryColor,
      ),
    ));
