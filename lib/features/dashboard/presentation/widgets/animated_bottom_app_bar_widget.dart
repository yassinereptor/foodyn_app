import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'dart:ui' as ui;

import 'waterfall_notched_rectangle_widget.dart';

class AnimatedBottomAppBarWidget extends StatefulWidget {
  AnimatedBottomAppBarWidget({
    Key? key,
    this.bottomAppBarController,
    required this.bottomAppBarCurve,
    this.bottomDrawerVisible,
    this.drawerController,
    this.dropArrowCurve,
    this.toggleBottomDrawerVisibility,
    required this.menuClicked
  }) : super(key: key);

  final AnimationController? bottomAppBarController;
  final Animation<double> bottomAppBarCurve;
  final bool? bottomDrawerVisible;
  final AnimationController? drawerController;
  final Animation<double>? dropArrowCurve;
  final ui.VoidCallback? toggleBottomDrawerVisibility;
  final bool menuClicked;

  @override
  _AnimatedBottomAppBarWidgetState createState() => _AnimatedBottomAppBarWidgetState();

}

class _AnimatedBottomAppBarWidgetState extends State<AnimatedBottomAppBarWidget> {

  @override
  Widget build(BuildContext context) {

 
        widget.bottomAppBarController?.forward();

        return SizeTransition(

          sizeFactor: widget.bottomAppBarCurve,
          axisAlignment: -1,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 2),
            child: Container(
              child: BottomAppBar(
                elevation: 0,
              color: isDark(context) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor,
              shape: const WaterfallNotchedRectangleWidget(),
              notchMargin: 6,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                color: Colors.transparent,
                height: kToolbarHeight,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(child: Icon(widget.menuClicked ? Icons.close : Icons.menu), onTap: (){
                      widget.toggleBottomDrawerVisibility!();
                    }),
                    GestureDetector(child: Icon(Icons.search), onTap: (){}),
                  ],
                ),
              ),
            ),
            )
          ),
        );
  }
}