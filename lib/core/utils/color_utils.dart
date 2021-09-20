import 'dart:ui';

import 'package:flutter/material.dart';

class ColorUtils {
  String hex;
  Color? color;

  ColorUtils(this.hex);
  
  Color toColor() {
    hex = hex.toLowerCase();
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex);
    color = Color(int.parse(buffer.toString(), radix: 16));
    return color!;
  }

  Color darken([double amount = .1]) {
    if (color == null)
      color = toColor();
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color!);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    if (color == null)
      color = toColor();
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color!);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}