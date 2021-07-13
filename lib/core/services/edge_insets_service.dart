import 'package:flutter/material.dart';

import '../utils/lang.dart';

class EdgeInsetsService extends EdgeInsets {
  /// Creates insets with symmetrical vertical and horizontal offsets.
  ///
  /// {@tool snippet}
  ///
  /// Eight pixel margin above and below, no horizontal margins:
  ///
  /// ```dart
  /// const EdgeInsets.symmetric(vertical: 8.0)
  /// ```
  /// {@end-tool}
  EdgeInsetsService.symmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) : super.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        );

  /// Creates insets where all the offsets are `value`.
  ///
  /// {@tool snippet}
  ///
  /// Typical eight-pixel margin on all sides:
  ///
  /// ```dart
  /// const EdgeInsets.all(8.0)
  /// ```
  /// {@end-tool}
  EdgeInsetsService.all(double value) : super.all(value);

  /// Creates insets with only the given values non-zero.
  ///
  /// {@tool snippet}
  ///
  /// Left margin indent of 40 pixels:
  ///
  /// ```dart
  /// const EdgeInsets.only(left: 40.0)
  /// ```
  /// {@end-tool}
  EdgeInsetsService.only({
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) : super.only(
          left: isAr() ? right : left,
          right: isAr() ? left : right,
          top: top,
          bottom: bottom,
        );

  /// Creates insets from offsets from the left, top, right, and bottom.
  EdgeInsetsService.fromLTRB(
    double left,
    double right,
    double top,
    double bottom,
  ) : super.fromLTRB(
          isFr() ? left : right,
          top,
          isFr() ? right : left,
          bottom,
        );
}
