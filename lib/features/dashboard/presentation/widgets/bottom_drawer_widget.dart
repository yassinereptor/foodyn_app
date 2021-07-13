import 'package:flutter/material.dart';

class BottomDrawerWidget extends StatelessWidget {
  const BottomDrawerWidget({
    Key? key,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.body,
  }) : super(key: key);

  final GestureDragUpdateCallback? onVerticalDragUpdate;
  final GestureDragEndCallback? onVerticalDragEnd;
  final Widget? body;

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