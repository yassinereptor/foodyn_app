import 'package:flutter/cupertino.dart';

class MenuItemModel {
  String title;
  IconData icon;
  Widget? body;

  MenuItemModel({
    required this.title,
    required this.icon,
    this.body,
  });
}
