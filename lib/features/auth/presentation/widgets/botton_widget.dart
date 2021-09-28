import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';

class ButtonWidget extends StatefulWidget {
  final void Function() onTap;
  final List<Widget> children;
  final Color background;

  const ButtonWidget({Key? key, required this.onTap, required this.children, this.background = GlobalTheme.kOrangeColor})
      : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            color: widget.background,
            borderRadius: BorderRadius.circular(10)),
        height: 65.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.children,
        ),
      ),
    );
  }
}
