import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  final AnimationController drawerController;
  final AnimationController dropArrowController;
  final bool bottomDrawerVisible;
  final double kFlingVelocity;
  final Widget child;

  const BottomSheetWidget({Key? key,
  required this.child,
  required this.drawerController, required this.dropArrowController,
  required this.kFlingVelocity, required this.bottomDrawerVisible,
  }) : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {

  @override
  void initState() {
    
    super.initState();
  }

   @override
  void dispose() {
    
    super.dispose();
  }

  void _toggleBottomDrawerVisibility() {
    if (widget.drawerController.value < 0.4) {
      widget.drawerController.animateTo(0.4, curve: standardEasing);
      widget.dropArrowController.animateTo(0.35, curve: standardEasing);
      return;
    }

    widget.dropArrowController.forward();
    widget.drawerController.fling(
      velocity: widget.bottomDrawerVisible ? -widget.kFlingVelocity : widget.kFlingVelocity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleBottomDrawerVisibility,
      child: widget.child
    );
  }

}
