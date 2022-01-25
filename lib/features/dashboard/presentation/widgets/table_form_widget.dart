import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/data/models/section_model.dart';
import 'package:foodyn_eatery/core/data/models/table_model.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/interactive_tables_map_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import 'text_form_range_widget.dart';

class TableFormWidget extends StatefulWidget {
  final SectionModel? sectionModel;
  final void Function(SectionModel?) onComplete;
  final void Function()? onDelete;
  
  const TableFormWidget({Key? key, required this.onComplete, this.sectionModel, this.onDelete}) : super(key: key);

  @override
  _TableFormWidgetState createState() => _TableFormWidgetState();
}

class _TableFormWidgetState extends State<TableFormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _rowsTextEditingController =
      new TextEditingController(text: "1");
  TextEditingController _columnsTextEditingController =
      new TextEditingController(text: "1");
  TextEditingController _tablesTextEditingController =
      new TextEditingController(text: "1");
  TextEditingController _tableStartTextEditingController =
      new TextEditingController(text: "1");
  TextEditingController _sectionTextEditingController =
      new TextEditingController();
  List<TableModel> _tableItemList = [];
  bool _onModify = false;
  int _rows = 1;
  int _columns = 1;
  int _tables = 1;

  @override
  void initState() {
    _tableItemList.add(TableModel(number: 1, row: 1, column: 1));
    if (widget.sectionModel != null) {
      _sectionTextEditingController.text = widget.sectionModel!.title!;
      _rowsTextEditingController.text = (_rows = widget.sectionModel!.rows!).toString();
      _columnsTextEditingController.text = (_columns = widget.sectionModel!.columns!).toString();
      _tablesTextEditingController.text = (_tables = widget.sectionModel!.tables!.length).toString();
      for(int row = 0; row < _rows; row++)
        for(int column = 0; column < _columns; column++)
          _tableItemList.add(TableModel(number: null, row: row + 1, column: column + 1));
      _tableItemList.forEach((element) {
        if (widget.sectionModel!.tables!.one((table) => table.row == element.row && table.column == element.column))
          element.number = widget.sectionModel!.tables!.singleWhere((table) => table.row == element.row && table.column == element.column).number;
      });
      _onModify = true;
    }
    super.initState();
  }

  
  void _onComplete() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState!.validate()) {
      SectionModel sectionModel = new SectionModel(
        title: _sectionTextEditingController.text,
        rows: _rows,
        columns: _columns,
        tables: _tableItemList.filter((element) => element.number != null).toList()
      );
      widget.onComplete(sectionModel);
    }
  }

  void _onCustomize() async {
    var result = await Routes.seafarer.navigate(InteractiveTablesMapPage.kRouteName,
        params: {"tableItemList": _tableItemList, "rows": _rows, "columns": _columns, "tables": _tables});
    if (result != null)
    {
      _tableItemList = result[0];
      _rows = result[1];
      _columns = result[2];
      _tables = result[3];
      setState(() {
        if (result[4] == true)
          _onModify = true;
        _rowsTextEditingController.text = _rows.toString();
        _columnsTextEditingController.text = _columns.toString();
        _tablesTextEditingController.text = _tables.toString();
      });
    }
  }

  void _onCancel() {
    widget.onComplete(null);
  }

  void _onDelete() {
    if (widget.onDelete != null)
      widget.onDelete!();
  }

  void _onAddTable() {
    setState(() {
      if (_tables < _columns * _rows)
      {
        _tables++;
        int max = (_tables > 1) ? _tableItemList.filter((element) => element.number != null).maximumBy((a, b) => a.number!.compareTo(b.number!))!.number! : int.parse(_tableStartTextEditingController.text);
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

  void _onRemoveTable() {
    if (_tables > 1)
    {
      setState(() {
        for(int i = _tableItemList.length - 1; i >= 0; i--)
        if (_tableItemList[i].number != null) {
          _tableItemList[i].number = null;
          _tables--;
          break;
        }
      });
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

  bool _onRemoveColumn() {
    bool canRemove = _tableItemList.where((element) => element.column == _columns).all((element) => element.number == null);
    if (!canRemove && _columns > 1)
    {
      _columnsTextEditingController.text = _columns.toString();
      return false;
    }
    setState(() {
      _tableItemList.removeWhere((element) => element.column == _columns);
      _columns--;
    });
    return true;
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
  
  bool _onRemoveRow() {
    bool canRemove = _tableItemList.where((element) => element.row == _rows).all((element) => element.number == null);
    if (!canRemove && _rows > 1)
    {  
      _rowsTextEditingController.text = _rows.toString();
      return false;
    }
    setState(() {
      _tableItemList.removeWhere((element) => element.row == _rows);
      _rows--;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormWidget(
                  onChanged: (_) {},
                  hint: "Section Name *",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '● Please enter a section name';
                    }
                    return null;
                  },
                  controller: _sectionTextEditingController,
                )),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: "Rows: ".text.xl.make(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormRangeWidget(
                        min: 1,
                        max: 250,
                        controller: _rowsTextEditingController,
                        onAdd: (number) {
                          _onAddRow();
                        },
                        onRemove: (number) {
                          if (!_onRemoveRow())
                          {
                            final snackBar =
                                SnackBar(content: Text("Remove tables from the row before delete it"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        onChanged: (text) {
                          setState(() {
                            // int tables = (int.parse(_rowsTextEditingController.text) * int.parse(_columnsTextEditingController.text));
                            // int currentTable = int.parse(_tablesTextEditingController.text);
                            // if (currentTable > tables) {
                            //   _tablesTextEditingController.text = tables.toString();
                            // }
                            // _rows = int.parse(_rowsTextEditingController.text);
                          });
                        }
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: "Columns: ".text.xl.make(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormRangeWidget(
                        min: 1,
                        max: 250,
                        controller: _columnsTextEditingController,
                        onAdd: (number) {
                          _onAddColumn();
                        },
                        onRemove: (number) {
                          if (!_onRemoveColumn())
                          {
                            final snackBar =
                                SnackBar(content: Text("Remove tables from the column before delete it"));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        onChanged: (text) {
                          setState(() {
                            // int tables = (int.parse(_rowsTextEditingController.text) * int.parse(_columnsTextEditingController.text));
                            // int currentTable = int.parse(_tablesTextEditingController.text);
                            // if (currentTable > tables) {
                            //   _tablesTextEditingController.text = tables.toString();
                            // }
                            // _columns = int.parse(_columnsTextEditingController.text);
                          });
                        }
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: "Tables: ".text.xl.make(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormRangeWidget(
                        min: 1,
                        max: (int.parse(_rowsTextEditingController.text) * int.parse(_columnsTextEditingController.text)),
                        controller: _tablesTextEditingController,
                        onAdd: (number) {
                          _onAddTable();
                        },
                        onRemove: (number) {
                          _onRemoveTable();
                        },
                        onChanged: (text) {
                          setState(() {
                            // _tables = int.parse(_tablesTextEditingController.text);
                          });
                        }
                      )
                    ),
                  ],
                ),
              ),
              if (!_onModify)
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: "Table N° Start: ".text.xl.make(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormRangeWidget(
                        min: 1,
                        max: 10000,
                        controller: _tableStartTextEditingController,
                        onChanged: (text) {
                          setState(() {
                            int startAt = int.parse(_tableStartTextEditingController.text);
                            int i = -1;
                            _tableItemList.forEach((element) {
                              if (element.number != null)
                                element.number = (++i + startAt);
                            });
                          });
                        },
                      )
                    ),
                  ],
                ),
              ),
              if (!_onModify)
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: "Table N° End: ".text.xl.make(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(left: 80),
                          child: ((int.parse(_tableStartTextEditingController.text) + int.parse(_tablesTextEditingController.text) - 1).toString()).text.bold.xl.make(),),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                onTap: _onCustomize,
                background: isDark(context) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor,
                children: [
                  "Customize Map"
                  .text
                  .xl
                  .color((isDark(context))
                      ? GlobalTheme.kAccentColor
                      : GlobalTheme.kPrimaryColor)
                  .make(),
                  SizedBox(width: 10,),
                          Icon(
                              Icons.grid_3x3_rounded,
                              color: GlobalTheme.kOrangeColor,
                              size: 30,
                            )
                ],
              ),
              SizedBox(
                    height: 20,
            ),
              ButtonWidget(
                onTap: _onComplete,
                children: [
                  "Create"
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
                onTap: (widget.sectionModel == null ? _onCancel : _onDelete),
                children: [
                  (widget.sectionModel == null ? "Cancel" : "Delete")
                      .text
                      .xl
                      .color((isDark(context))
                          ? GlobalTheme.kPrimaryColor
                          : GlobalTheme.kAccentColor)
                      .make(),
                ],
              ),
            ]));
  }
}
