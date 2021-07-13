import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/bottom_drawer_items_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/bottom_drawer_widget.dart';
import 'dart:math' as math;

class BottomSheetContainerWidget extends StatefulWidget {
  final Widget Function(AnimationController, AnimationController, bool, double) buildWidget;
  const BottomSheetContainerWidget({Key? key, required this.buildWidget}) : super(key: key);

  @override
  _BottomSheetContainerWidgetState createState() => _BottomSheetContainerWidgetState();
}

class _BottomSheetContainerWidgetState extends State<BottomSheetContainerWidget> with TickerProviderStateMixin{
  
  final _bottomDrawerKey = GlobalKey(debugLabel: 'Bottom Drawer');
  late AnimationController _drawerController;
  late AnimationController _dropArrowController;
  late AnimationController _bottomAppBarController;
  late Animation<double> _drawerCurve;
  late Animation<double> _dropArrowCurve;
  late Animation<double> _bottomAppBarCurve;
  static const double _kFlingVelocity = 2.0;
  static const _kAnimationDuration = Duration(milliseconds: 300);
  late bool _menuClicked;

  bool get _bottomDrawerVisible {
    final status = _drawerController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  double get _bottomDrawerHeight {
    final renderBox =
        _bottomDrawerKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  void _handleDragUpdate(DragUpdateDetails? details) {
    _drawerController.value -= details!.primaryDelta! / _bottomDrawerHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_drawerController.isAnimating ||
        _drawerController.status == AnimationStatus.completed) {
      return;
    }

    final flingVelocity =
        details.velocity.pixelsPerSecond.dy / _bottomDrawerHeight;

    if (flingVelocity < 0.0) {
      _drawerController.fling(
        velocity: math.max(_kFlingVelocity, -flingVelocity),
      );
    } else if (flingVelocity > 0.0) {
      _dropArrowController.forward();
      _drawerController.fling(
        velocity: math.min(-_kFlingVelocity, -flingVelocity),
      );
    } else {
      if (_drawerController.value < 0.6) {
        _dropArrowController.forward();
      }
      _drawerController.fling(
        velocity:
            _drawerController.value < 0.6 ? -_kFlingVelocity : _kFlingVelocity,
      );
    }
  }

  @override
  void initState() {
    _menuClicked = false;
    
    _drawerController = AnimationController(
      duration: _kAnimationDuration,
      value: 0,
      vsync: this,
    )..addListener(() {
        if (_drawerController.value < 0.01) {
          setState(() {
            //Reload state when drawer is at its smallest to toggle visibility
            //If state is reloaded before this drawer closes abruptly instead
            //of animating.
          });
        }
      });

    _dropArrowController = AnimationController(
      duration: _kAnimationDuration,
      vsync: this,
    );

    _bottomAppBarController = AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 250),
    );

    _dropArrowController.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        setState(() {
          _menuClicked = !_menuClicked;
        });
    });

    _drawerCurve = CurvedAnimation(
      parent: _drawerController,
      curve: standardEasing,
      reverseCurve: standardEasing.flipped,
    );

    _dropArrowCurve = CurvedAnimation(
      parent: _dropArrowController,
      curve: standardEasing,
      reverseCurve: standardEasing.flipped,
    );

    _bottomAppBarCurve = CurvedAnimation(
      parent: _bottomAppBarController,
      curve: standardEasing,
      reverseCurve: standardEasing.flipped,
    );
    super.initState();
  }

   @override
  void dispose() {
    _drawerController.dispose();
    _dropArrowController.dispose();
    _bottomAppBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final drawerSize = constraints.biggest;
        final drawerTop = drawerSize.height;

        final drawerAnimation = RelativeRectTween(
          begin: RelativeRect.fromLTRB(0.0, drawerTop, 0.0, 0.0),
          end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
        ).animate(_drawerCurve);

        return Stack(
          clipBehavior: Clip.none,
          key: _bottomDrawerKey,
          children: [
            widget.buildWidget(_drawerController, _dropArrowController, _bottomDrawerVisible, _kFlingVelocity),
            GestureDetector(
              onTap: () {
                _drawerController.reverse();
                _dropArrowController.reverse();
              },
              child: Visibility(
                maintainAnimation: true,
                maintainState: true,
                visible: _bottomDrawerVisible,
                child: FadeTransition(
                  opacity: _drawerCurve,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color:
                        Theme.of(context).bottomSheetTheme.modalBackgroundColor,
                  ),
                ),
              ),
            ),
            PositionedTransition(
              rect: drawerAnimation,
              child: Visibility(
                visible: _bottomDrawerVisible,
                child: BottomDrawerWidget(
                  onVerticalDragUpdate: _handleDragUpdate,
                  onVerticalDragEnd: _handleDragEnd,
                  body: BottomDrawerItemsWidget(
                    items: [],
                    drawerController: _drawerController,
                    dropArrowController: _dropArrowController,
                    onItemTapped: (item){

                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
