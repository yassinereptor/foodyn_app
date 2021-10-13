import 'dart:io';

import 'dart:ui';

class TagItemModel {
  final int id;
  final String title;
  final int grade;
  final Color background;
  final Color color;

  TagItemModel({
    required this.id,
    required this.title,
    required this.grade,
    required this.background,
    required this.color
  });
}