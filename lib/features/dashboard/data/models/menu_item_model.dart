import 'package:flutter/cupertino.dart';
import 'package:foodyn_eatery/core/config/theme/global_theme.dart';

class MenuItemModel {
  String title;
  IconData icon;
  void Function()? onTap;
  Color? backgroud;
  Color? forground;

  MenuItemModel({
    required this.title,
    required this.icon,
    this.onTap,
    this.backgroud = GlobalTheme.kOrangeColor,
    this.forground = GlobalTheme.kAccentColor
  });
}
