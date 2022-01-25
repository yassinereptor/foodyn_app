import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

final ThemeData theme = ThemeData();

final lightTheme = theme.copyWith(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: GlobalTheme.kAccentColor,
    colorScheme: theme.colorScheme.copyWith(secondary: GlobalTheme.kPrimaryColor),
    scaffoldBackgroundColor: GlobalTheme.kAccentColor,
    backgroundColor: GlobalTheme.kAccentColor,
    inputDecorationTheme: inputDecorationTheme,
    errorColor: Colors.redAccent.shade400,
    iconTheme: IconThemeData(color: GlobalTheme.kPrimaryColor),
    dividerColor: GlobalTheme.kOrangeColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
      ),
      iconTheme: IconThemeData(color: GlobalTheme.kPrimaryColor),
      toolbarTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: GlobalTheme.kPoppinsFont,
          fontSize: 18.0,
        )
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: GlobalTheme.kPrimaryColor,
        fontFamily: GlobalTheme.kPoppinsFont,
      ),
      bodyText2: TextStyle(
        color: GlobalTheme.kPrimaryColor,
        fontFamily: GlobalTheme.kPoppinsFont,
      ),
      headline1: TextStyle(
        color: GlobalTheme.kPrimaryColor,
        fontFamily: GlobalTheme.kPoppinsFont,
      ),
      headline2: TextStyle(
        color: GlobalTheme.kPrimaryColor,
        fontFamily: GlobalTheme.kPoppinsFont,
      ),
      headline3: TextStyle(
        color: GlobalTheme.kPrimaryColor,
        fontFamily: GlobalTheme.kPoppinsFont,
      ),
      headline4: TextStyle(
        color: GlobalTheme.kPrimaryColor,
        fontFamily: GlobalTheme.kPoppinsFont,
      ),
      headline5: TextStyle(
        color: GlobalTheme.kPrimaryColor,
        fontFamily: GlobalTheme.kPoppinsFont,
      ),
      headline6: TextStyle(
        color: GlobalTheme.kPrimaryColor,
        fontFamily: GlobalTheme.kPoppinsFont,
      ),
      subtitle1: TextStyle(
        fontFamily: GlobalTheme.kPoppinsFont,
        color: GlobalTheme.kPrimaryColor,
      ),
      subtitle2: TextStyle(
        fontFamily: GlobalTheme.kPoppinsFont,
        color: GlobalTheme.kPrimaryColor,
      ),
      button: TextStyle(
        fontFamily: GlobalTheme.kPoppinsFont,
        color: GlobalTheme.kPrimaryColor,
      ),
      caption:  TextStyle(
        fontFamily: GlobalTheme.kPoppinsFont,
        color: GlobalTheme.kPrimaryColor,
      ),
      overline:   TextStyle(
        fontFamily: GlobalTheme.kPoppinsFont,
        color: GlobalTheme.kPrimaryColor,
      )
    ));
