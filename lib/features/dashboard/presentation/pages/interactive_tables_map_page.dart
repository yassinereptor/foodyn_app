import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/data/models/table_model.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/table_widget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class InteractiveTablesMapPage extends StatefulWidget {
  static const kRouteName = "/interactive-tables-map";

  final List<TableModel> tableItemList;
  final int rows;
  final int columns;
  final int tables;

  const InteractiveTablesMapPage({
    Key? key,
    required this.tableItemList,
    required this.rows,
    required this.columns,
    required this.tables
  }) : super(key: key);

  @override
  _InteractiveTablesMapPageState createState() =>
      _InteractiveTablesMapPageState();
}

class _InteractiveTablesMapPageState extends State<InteractiveTablesMapPage> {
  late int _rows;
  late int _columns;
  late int _tables;
  TransformationController _transformationController =
      TransformationController();
  bool _openOptions = false;
  List<TableModel> _tableItemList = [];
  bool _onModify = false;

  @override
  void initState() {
    _rows = widget.rows;
    _columns = widget.columns;
    _tables = widget.tables;
    widget.tableItemList.forEach((element) {
      _tableItemList.add(TableModel(number: element.number, row: element.row, column: element.column));
    });
    super.initState();
  }

  void _onComplete() {
    Routes.seafarer.pop([_tableItemList, _rows, _columns, _tables, _onModify]);
  }

  void _onAddTable() {
    setState(() {
      if (_tables < _columns * _rows)
      {
        _tables++;
        int max = _tableItemList.filter((element) => element.number != null).maximumBy((a, b) => a.number!.compareTo(b.number!))!.number!;
        for (int row = 0; row < _rows; row++)
          for (int column = 0; column < _columns; column++)
            if (_tableItemList[((row * _columns) + column)].number == null)
            {
              _tableItemList[((row * _columns) + column)] = new TableModel(number: max + 1, row: row + 1, column: column + 1);
              return ;
            }
      }
    });
  }

  void _onRemoveTable(int index) {
    if (_tables > 1)
    {
      setState(() {
          _tableItemList[index].number = null;
          _tables--;
      });
    } else {
      final snackBar =
          SnackBar(content: Text("You can't delete, Must be at least one table"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _onAddColumn() {
    setState(() {
      if (_columns < 250)
      {
        List<TableModel> tmp = [];
        for (int row = 0; row < _rows; row++)
          for (int column = 0; column < _columns; column++)
          {
            tmp.add(_tableItemList[((row * _columns) + column)]);
            if (column + 1 == _columns)
              tmp.add(TableModel(number: null, row: row + 1, column: column + 2));
          }
        _tableItemList = tmp;
        _columns++;
      }
    });
  }

  void _onAddRow() {
    setState(() {
      if (_rows < 250)
      {
        for (int column = 0; column < _columns; column++)
          _tableItemList.add(TableModel(number: null, row: _rows + 1, column: column + 1));
        _rows++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_openOptions)
            Column(
              children: [
                FloatingActionButton(
                    heroTag: "btn4",
                    onPressed: _onComplete,
                    backgroundColor: GlobalTheme.kGreenColor,
                    child: Icon(
                      Icons.save_rounded,
                      color: isDark(context)
                          ? GlobalTheme.kPrimaryColor
                          : GlobalTheme.kAccentColor,
                    )),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                    heroTag: "btn1",
                    onPressed: _onAddTable,
                    backgroundColor: isDark(context)
                        ? GlobalTheme.kPrimaryLightColor
                        : GlobalTheme.kAccentDarkColor,
                    child: Icon(
                      Icons.table_chart,
                      color: isDark(context)
                          ? GlobalTheme.kAccentColor
                          : GlobalTheme.kPrimaryColor,
                    )),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                    heroTag: "btn2",
                    onPressed: _onAddColumn,
                    backgroundColor: isDark(context)
                        ? GlobalTheme.kPrimaryLightColor
                        : GlobalTheme.kAccentDarkColor,
                    child: Icon(
                      Icons.view_column_rounded,
                      color: isDark(context)
                          ? GlobalTheme.kAccentColor
                          : GlobalTheme.kPrimaryColor,
                    )),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                    heroTag: "btn3",
                    onPressed: _onAddRow,
                    backgroundColor: isDark(context)
                        ? GlobalTheme.kPrimaryLightColor
                        : GlobalTheme.kAccentDarkColor,
                    child: Icon(
                      Icons.table_rows_rounded,
                      color: isDark(context)
                          ? GlobalTheme.kAccentColor
                          : GlobalTheme.kPrimaryColor,
                    )),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                    heroTag: "btn6",
                    onPressed: () => Routes.seafarer.pop(),
                    backgroundColor: GlobalTheme.kRedColor,
                    child: Icon(
                      Icons.close,
                      color: isDark(context)
                          ? GlobalTheme.kPrimaryColor
                          : GlobalTheme.kAccentColor,
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          FloatingActionButton(
              heroTag: "btn5",
              onPressed: () {
                setState(() {
                  _openOptions = !_openOptions;
                });
              },
              backgroundColor: GlobalTheme.kOrangeColor,
              child: RotatedBox(
                quarterTurns: _openOptions ? 3 : 1,
                child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: isDark(context)
                      ? GlobalTheme.kPrimaryColor
                      : GlobalTheme.kAccentColor,
                ),
              ),
              ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SafeArea(
        child: PhotoView.customChild(
          childSize: Size(max(100.0 * _rows, 100.0 * _columns), max(100.0 * _rows, 100.0 * _columns)),
          backgroundDecoration: BoxDecoration(color: Colors.transparent),
          customSize: MediaQuery.of(context).size,
          enableRotation: true,
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 1.8,
          initialScale: PhotoViewComputedScale.contained,
          basePosition: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Table(
              columnWidths: <int, TableColumnWidth>{
                for (int column = 0; column < _columns; column++)
                  column: const FixedColumnWidth(100.0),
              },
              children: <TableRow>[
                for (int row = 0; row < _rows; row++)
                  TableRow(
                    children: <Widget>[
                      for (int column = 0; column < _columns; column++)
                        Container(
                          height: 100,
                          child: Stack(
                            children: [
                              DragTarget<int>(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> accepted,
                                  List<dynamic> rejected,
                                ) {
                                  return Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                            height: 3,
                                            width: 100,
                                            color: GlobalTheme.kOrangeColor
                                                .withOpacity(.2)),
                                      ),
                                      Center(
                                        child: Container(
                                            height: 100,
                                            width: 3,
                                            color: GlobalTheme.kOrangeColor
                                                .withOpacity(.2)),
                                      ),
                                      Center(
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: GlobalTheme.kOrangeColor
                                                  .withOpacity(.2),
                                              shape: BoxShape.circle),
                                        ),
                                      )
                                    ],
                                  );
                                },
                                onAccept: (int data) {
                                  if (_tableItemList[((row * _columns) + column)].number == null) {
                                    setState(() {
                                      _tableItemList[((row * _columns) + column)].number = _tableItemList[data].number;
                                      _tableItemList[data].number = null;
                                      _onModify = true;
                                    });
                                  }
                                },
                              ),
                              if (_tableItemList[((row * _columns) + column)].number != null)
                                Center(
                                  child: Draggable<int>(
                                    data: ((row * _columns) + column),
                                    child: TableWidget(
                                      number: _tableItemList[((row * _columns) + column)].number!,
                                      index: ((row * _columns) + column),
                                      numbers: _tableItemList.filter((element) => element.number != null).map<int>((e) => e.number!).toList(),
                                      color: GlobalTheme.kOrangeColor,
                                      background: isDark(context)
                                          ? GlobalTheme.kPrimaryColor
                                          : GlobalTheme.kAccentColor,
                                      onModify: (number) {
                                        setState(() {
                                          _tableItemList[((row * _columns) + column)].number = number;
                                          _onModify = true;
                                        });
                                      },
                                      onRemoveTable: _onRemoveTable
                                    ),
                                    feedback: TableWidget(
                                      number: _tableItemList[((row * _columns) + column)].number!,
                                      index: ((row * _columns) + column),
                                      numbers: _tableItemList.filter((element) => (element.number != null)).map<int>((e) => e.number!).toList(),
                                      color: GlobalTheme.kOrangeColor
                                          .withOpacity(.5),
                                      background: isDark(context)
                                          ? GlobalTheme.kPrimaryColor
                                          : GlobalTheme.kAccentColor,
                                      onModify: (number) {
                                        setState(() {
                                          _tableItemList[((row * _columns) + column)].number = number;
                                          _onModify = true;
                                        });
                                      },
                                      onRemoveTable: _onRemoveTable
                                    ),
                                    childWhenDragging: Container(),
                                  ),
                                )
                            ],
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
