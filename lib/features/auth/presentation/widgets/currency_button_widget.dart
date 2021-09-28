import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/data/models/plan_model.dart';
import 'package:foodyn_rest/core/utils/color_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bottom_sheet_widget.dart';
import 'text_form_widget.dart';

class CurrencyButtonWidget extends StatefulWidget {
  final void Function(int) onSelect;
  final String Function(String) modifyListOutput;
  final PlanModel plan;
  final Color color;

  const CurrencyButtonWidget(
      {Key? key, required this.onSelect, required this.modifyListOutput, required this.plan, required this.color})
      : super(key: key);

  @override
  _CurrencyButtonWidgetState createState() => _CurrencyButtonWidgetState();
}

class _CurrencyButtonWidgetState extends State<CurrencyButtonWidget> {
  List<String> _list = [];
  late TextEditingController _textEditingController;

  @override
  void initState() {
    Map<String, dynamic> jsonObject = json.decode(widget.plan.monthPrice!);
    _list = jsonObject.keys.toList();
    _textEditingController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        BottomSheetWidget.showBottomSheetWidget(
            context,
            _CurrencyButtonInsideWidget(
              modifyListOutput: widget.modifyListOutput,
              list: _list,
              onSelect: widget.onSelect,
              textEditingController: _textEditingController,
              searchForm: true,
            )),
      },
      child: Icon(Icons.monetization_on, color: widget.color),
    );
  }
}

class _CurrencyButtonInsideWidget extends StatefulWidget {
  final List<String> list;
  final void Function(int) onSelect;
  final String Function(String) modifyListOutput;
  final TextEditingController textEditingController;
  final bool searchForm;

  const _CurrencyButtonInsideWidget(
      {Key? key,
      required this.modifyListOutput,
      required this.list,
      required this.onSelect,
      required this.textEditingController,
      required this.searchForm})
      : super(key: key);

  @override
  _CurrencyButtonInsideWidgetState createState() =>
      _CurrencyButtonInsideWidgetState();
}

class _CurrencyButtonInsideWidgetState
    extends State<_CurrencyButtonInsideWidget> {
  late List<String> foundList;

  @override
  void initState() {
    foundList = widget.list;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void runFilter(String text) {
    text = text.toLowerCase();
    List<String> result;
    if (text.isEmpty)
      result = widget.list;
    else
      result = widget.list.where((element) {
        return (element.toString().toLowerCase().contains(text));
      }).toList();
    setState(() {
      foundList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (widget.searchForm)
            ? Row(
                children: [
                  Expanded(
                      child: TextFormWidget(
                    controller: widget.textEditingController,
                    onChanged: (text) => runFilter(text!),
                    hint: "Search",
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                  )),
                  Container(
                    height: 65,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: GlobalTheme.kOrangeColor,
                      ),
                    ),
                  )
                ],
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: foundList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  int listIndex = widget.list.indexOf(foundList[index]);
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setInt("user_settings_currency", listIndex);
                  widget.onSelect(listIndex);
                  widget.textEditingController.clear();
                  Routes.seafarer.pop();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: widget
                            .modifyListOutput(foundList[index])
                            .text
                            .size(Vx.dp16)
                            .make()),
                  ],
                ),
              );
            })
      ],
    );
  }
}
