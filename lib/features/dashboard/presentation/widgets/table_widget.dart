import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/widgets/dialogs/jwt_expired_dialog.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/table_number_dialog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class TableWidget extends StatefulWidget {
  final Color color;
  final Color background;
  final int number;
  final int index;
  final List<int> numbers;
  final void Function(int) onModify;
  final void Function(int) onRemoveTable;

  const TableWidget({Key? key, required this.color, required this.onModify, required this.onRemoveTable, required this.background, required this.number, required this.index, required this.numbers}) : super(key: key);

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {

  @override
  void initState() {
    super.initState();
  }

  void _onTapTable() {
    showDialog(
      barrierColor: Colors.transparent,
      context: Routes.seafarer.navigatorKey!.currentContext!,
      builder: (context) {
        return TableNumberDialog(
          number: widget.number,
          index: widget.index,
          numbers: widget.numbers,
          onRemoveTable: widget.onRemoveTable
          );
      },
    ).then((value) {
      if (value != null)
       widget.onModify(value[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapTable,
      child: Container(
        decoration: BoxDecoration(
          color: widget.background,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.all(3),
        child: Stack(
          children: [
            Container(
              width: 60,
              height: 45,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            Positioned(
              bottom: 0,
              left: (15 + (15 / 2)),
              child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: widget.background,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50), )
                    ),
                  ),
            ),
            Positioned(
              top: 6,
              left: 0,
              child: Container(
                width: 60,
                alignment: Alignment.center,
                      child: widget.number.text.color(GlobalTheme.kAccentColor).bold.make(),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
