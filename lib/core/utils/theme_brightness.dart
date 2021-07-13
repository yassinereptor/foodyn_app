import 'package:flutter/material.dart';

bool isDark(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}

bool isLight(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light;
}
