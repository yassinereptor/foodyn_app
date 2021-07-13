import 'package:flutter/material.dart';

void addPostFrameCallback(void Function(Duration timeStamp) callback) {
  WidgetsBinding.instance!.addPostFrameCallback(callback);
}
