import 'dart:io';

import 'package:flutter/cupertino.dart';

class ImageItemModel {
  final File file;
  final double aspectRatio;

  ImageItemModel({
    required this.file,
    required this.aspectRatio,
  });
}
