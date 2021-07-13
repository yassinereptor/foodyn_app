import 'package:flutter/material.dart';

class PlanModel {
  String title;
  int price;
  String currency;
  String text;
  String fulltext;
  List<Color> colors;
  bool recommended;
  bool discount;
  double discount_perc;

  PlanModel({
    required this.title,
    required this.price,
    required this.currency,
    required this.text,
    required this.fulltext,
    required this.colors,
    this.recommended = false,
    this.discount = false,
    this.discount_perc = 0.0,
  });
}