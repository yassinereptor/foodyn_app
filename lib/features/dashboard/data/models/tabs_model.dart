import 'package:flutter/cupertino.dart';

class TabsModel {
  String title;
  IconData icon;
  List<TabsModel>? subtitles;
  int selected_subtitle;
  Widget? body;

  TabsModel({
    required this.title,
    required this.icon,
    this.subtitles = null,
    this.body = null,
    this.selected_subtitle = 0
  });
}
