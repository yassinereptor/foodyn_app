import 'dart:ui';

import 'package:flutter/material.dart';

class ColorUtils {
  String _hex;
  Color? _color;

  ColorUtils(this._hex);
  
  Color toColor() {
    _hex = _hex.toLowerCase();
    final buffer = StringBuffer();
    if (_hex.length == 6 || _hex.length == 7) buffer.write('ff');
    buffer.write(_hex);
    _color = Color(int.parse(buffer.toString(), radix: 16));
    return _color!;
  }

  Color darken([double amount = .1]) {
    if (_color == null)
      _color = toColor();
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(_color!);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    if (_color == null)
      _color = toColor();
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(_color!);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}