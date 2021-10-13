import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'global_theme.dart';
import 'input_decoration_theme.dart';

final fillColor = GlobalTheme.kPrimaryLightColor;

final hightLightColor = GlobalTheme.kAccentColor;
final darkBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Vx.dp10),
      borderSide: BorderSide(color: GlobalTheme.kPrimaryLightColor, width: 1),
    );

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: GlobalTheme.kPrimaryColor,
  accentColor: GlobalTheme.kAccentColor,
  backgroundColor: GlobalTheme.kPrimaryColor,
  errorColor: Colors.redAccent.shade400,
  scaffoldBackgroundColor: GlobalTheme.kPrimaryColor,
  inputDecorationTheme: inputDecorationTheme.copyWith(
    fillColor: fillColor,
    border: darkBorder,
    focusedErrorBorder: darkBorder,
    errorBorder: darkBorder,
    disabledBorder: darkBorder,
    enabledBorder: darkBorder,
  ),
  fontFamily: GlobalTheme.kPoppinsFont,
  iconTheme: IconThemeData(color: GlobalTheme.kAccentColor),
  dividerColor: GlobalTheme.kOrangeColor,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark
    ),
    iconTheme: IconThemeData(color: GlobalTheme.kAccentColor),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: GlobalTheme.kAccentColor,
        fontWeight: FontWeight.w500,
        fontFamily: GlobalTheme.kPoppinsFont,
        fontSize: 18.0,
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontFamily: GlobalTheme.kPoppinsFont,
      color: GlobalTheme.kAccentColor,
    ),
    bodyText2: TextStyle(
      fontFamily: GlobalTheme.kPoppinsFont,
      color: GlobalTheme.kAccentColor,
    ),
    headline1: TextStyle(
      fontFamily: GlobalTheme.kPoppinsFont,
      color: GlobalTheme.kAccentColor,
    ),
    headline2: TextStyle(
      fontFamily: GlobalTheme.kPoppinsFont,
      color: GlobalTheme.kAccentColor,
    ),
    headline3: TextStyle(
      fontFamily: GlobalTheme.kPoppinsFont,
      color: GlobalTheme.kAccentColor,
    ),
    headline4: TextStyle(
      fontFamily: GlobalTheme.kPoppinsFont,
      color: GlobalTheme.kAccentColor,
    ),
    headline5: TextStyle(
      fontFamily: GlobalTheme.kPoppinsFont,
      color: GlobalTheme.kAccentColor,
    ),
    headline6: TextStyle(
      fontFamily: GlobalTheme.kPoppinsFont,
      color: GlobalTheme.kAccentColor,
    ),
  ),
);
