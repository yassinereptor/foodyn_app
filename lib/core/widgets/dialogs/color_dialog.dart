import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:foodyn_eatery/core/utils/theme_brightness.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import '../../config/router/router.dart';
import '../../config/theme/global_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ColorDialog extends StatefulWidget {
  final Color pickerColor;

  const ColorDialog({
    required this.pickerColor,
    Key? key,
  }) : super(key: key);

  @override
  _ColorDialogState createState() => _ColorDialogState();
}

class _ColorDialogState extends State<ColorDialog> {
  late Color _currentColor;

  @override
  void initState() {
    _currentColor = widget.pickerColor;
    super.initState();
  }

  void changeColor(Color color) {
    setState(() => _currentColor = color);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        insetPadding: Vx.m0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: isDark(context) ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: _width - 40,
                        padding: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: isDark(context)
                            ? GlobalTheme.kPrimaryColor
                            : GlobalTheme.kAccentColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ColorPicker(
                              pickerColor: _currentColor,
                              onColorChanged: changeColor,
                              showLabel: true,
                              pickerAreaHeightPercent: 0.8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                              child: Column(
                                children: [
                                  ButtonWidget(
                                    background: GlobalTheme.kOrangeColor,
                                    onTap: () {
                                      Routes.seafarer.pop([_currentColor]);
                                    },
                                    children: [
                                      "Save"
                                          .text
                                          .xl
                                          .color((isDark(context))
                                              ? GlobalTheme.kPrimaryColor
                                              : GlobalTheme.kAccentColor)
                                          .make(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ButtonWidget(
                                    background: GlobalTheme.kRedColor,
                                    onTap: () {
                                      Routes.seafarer.pop();
                                    },
                                    children: [
                                      "Cancel"
                                          .text
                                          .xl
                                          .color((isDark(context))
                                              ? GlobalTheme.kPrimaryColor
                                              : GlobalTheme.kAccentColor)
                                          .make(),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
      )
    );
  }
}
