import 'package:flutter/material.dart';

class BottomDrawerWidget extends StatelessWidget {
  BottomDrawerWidget({
    Key? key,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.body,
    this.scrollController
  }) : super(key: key);

  final GestureDragUpdateCallback? onVerticalDragUpdate;
  final GestureDragEndCallback? onVerticalDragEnd;
  final Widget? body;
  ScrollController? scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      child: Material(
        color: theme.bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(12),
          physics: const NeverScrollableScrollPhysics(),
          children: [
             body!,
          ],
        ),
      ),
    );
  }
}