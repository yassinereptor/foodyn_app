import 'package:flutter/cupertino.dart';

class TabsModel {
  String title;
  IconData icon;
  List<TabsModel>? subtitles;
  int selectedSubtitle;
  Widget? body;

  TabsModel({
    required this.title,
    required this.icon,
    this.subtitles,
    this.body,
    this.selectedSubtitle = 0
  });
}
