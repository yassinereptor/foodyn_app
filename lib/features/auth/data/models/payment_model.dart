import 'package:flutter/material.dart';

class PaymentModel {
  String title;
  String asset;
  List<Color> colors;
  bool exist;
  void Function()? onTap;

  PaymentModel({
    required this.title,
    required this.asset,
    required this.colors,
    this.exist = true,
    required this.onTap
  });
}