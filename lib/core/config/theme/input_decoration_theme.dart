import 'package:flutter/material.dart';
import 'global_theme.dart';
import 'package:velocity_x/velocity_x.dart';

final labelStyle = TextStyle(
  fontSize: Vx.dp16,
  // fontWeight: FontWeight.w500,
  // height: 0,
);


final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(Vx.dp10),
  borderSide: BorderSide(color: borderColor, width: 1),
);

final focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(Vx.dp10),
  borderSide: BorderSide(color: GlobalTheme.kOrangeColor, width: 1),
);

final errorStyle = TextStyle(
  height: Vx.dp1,
  fontWeight: FontWeight.w500,
);

final fillColor = GlobalTheme.kAccentDarkColor;
final borderColor = GlobalTheme.kAccentDarkColor;

final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  labelStyle: labelStyle,
  alignLabelWithHint: true,
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  fillColor: fillColor,
  filled: true,
  errorStyle: errorStyle,
  border: border,
  errorBorder: border,
  disabledBorder: border,
  enabledBorder: border,
  focusedBorder: focusedBorder,
  focusedErrorBorder: focusedBorder,
);
