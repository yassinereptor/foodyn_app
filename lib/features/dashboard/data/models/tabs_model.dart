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
    this.subtitles,
    this.body,
    this.selected_subtitle = 0
  });
}
