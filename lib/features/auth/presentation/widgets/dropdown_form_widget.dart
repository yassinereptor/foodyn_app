import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'text_form_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bottom_sheet_widget.dart';

class DropdownFormWidget extends StatefulWidget {
  final List<String> list;
  final int defaultIndex;
  final void Function(String, int) onSelect;
  final String Function(String) modifySelectedOutput;
  final String Function(String) modifyListOutput;
  final bool searchForm;
  final bool rightRadius;

  const DropdownFormWidget(
      {Key? key,
      required this.modifySelectedOutput,
      required this.modifyListOutput,
      required this.list,
      this.defaultIndex = 0,
      required this.onSelect,
      this.searchForm = true,
      this.rightRadius = true
      })
      : super(key: key);

  @override
  _DropdownFormWidgetState createState() => _DropdownFormWidgetState();
}

class _DropdownFormWidgetState extends State<DropdownFormWidget> {
  late int defaultIndex;
  late TextEditingController _textEditingController;

  
  @override
  void initState() {
    _textEditingController = new TextEditingController();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    defaultIndex = widget.defaultIndex;

    return GestureDetector(
      onTap: () => BottomSheetWidget.showBottomSheetWidget(
          context,
          _DropdownFormInsideWidget(modifyListOutput: widget.modifyListOutput, list: widget.list, onSelect: widget.onSelect, textEditingController: _textEditingController, searchForm: widget.searchForm,)),
      child: Container(
        constraints: BoxConstraints(maxHeight: 65),
        decoration: BoxDecoration(
            color: GlobalTheme.kAccentDarkColor,
            borderRadius: (widget.rightRadius) ? BorderRadius.circular(10) : BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.list.isNotEmpty)
            widget
                .modifySelectedOutput(widget.list[defaultIndex])
                .text
                .size(Vx.dp16)
                .make(),
            Icon(Icons.unfold_more)
          ],
        ),
      ),
    );
  }
}



class _DropdownFormInsideWidget extends StatefulWidget {
  final List<String> list;
  final void Function(String, int) onSelect;
  final String Function(String) modifyListOutput;
  final TextEditingController textEditingController;
  final bool searchForm;

  const _DropdownFormInsideWidget(
      {Key? key,
      required this.modifyListOutput,
      required this.list,
      required this.onSelect,
      required this.textEditingController,
      required this.searchForm})
      : super(key: key);

  @override
  _DropdownFormInsideWidgetState createState() => _DropdownFormInsideWidgetState();
}

class _DropdownFormInsideWidgetState extends State<_DropdownFormInsideWidget> {
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
    
    if (text.isNotEmpty && (text.isNumber() || text.isLetter()))
      result = widget.list.where((element) {
        return (element.toLowerCase().contains(text));
      }).toList();
    else
      result = widget.list;
    setState(() {
      foundList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              (widget.searchForm) ? Row(
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
              ) : Container(),
              SizedBox(
                height: 10,
              ),
              ...foundList.map((e) => InkWell(
                    onTap: () {
                      widget.onSelect(e, widget.list.indexOf(e));
                      widget.textEditingController.clear();
                      Routes.seafarer.pop();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: widget.modifyListOutput(e).text.size(Vx.dp16).make()
                        ),
                      ],
                    ),
                  )
              )
            ],
          );
  }
}