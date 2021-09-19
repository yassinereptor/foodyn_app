import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math' as math;

import 'bottom_sheet_widget.dart';

class DropdownFormWidget extends StatefulWidget {
  final List<String> list;
  final int defaultIndex;
  final void Function(int) onSelect;
  final String Function(String) modifySelectedOutput;
  final String Function(String) modifyListOutput;
  final bool searchForm;

  const DropdownFormWidget(
      {Key? key,
      required this.modifySelectedOutput,
      required this.modifyListOutput,
      required this.list,
      this.defaultIndex = 0,
      required this.onSelect,
      this.searchForm = true})
      : super(key: key);

  @override
  _DropdownFormWidgetState createState() => _DropdownFormWidgetState();
}

class _DropdownFormWidgetState extends State<DropdownFormWidget> {
  late int defaultIndex;
  late TextEditingController textEditingController;

  
  @override
  void initState() {
    textEditingController = new TextEditingController();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    defaultIndex = widget.defaultIndex;

    return GestureDetector(
      onTap: () => BottomSheetWidget.showBottomSheetWidget(
          context,
          _DropdownFormInsideWidget(modifyListOutput: widget.modifyListOutput, list: widget.list, onSelect: widget.onSelect, textEditingController: textEditingController, searchForm: widget.searchForm,)),
      child: Container(
        constraints: BoxConstraints(maxHeight: 65),
        decoration: BoxDecoration(
            color: GlobalTheme.kAccentDarkColor,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
  final void Function(int) onSelect;
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
    if (text.isEmpty)
      result = widget.list;
    else
      result = widget.list.where((element) {
        final jsonResult = json.decode(element);
        return (jsonResult["name"].toString().toLowerCase().contains(text) ||
            jsonResult["code"].toString().toLowerCase().contains(text) ||
            jsonResult["dialCode"].toString().toLowerCase().contains(text));
      }).toList();
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: foundList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      widget.onSelect(widget.list.indexOf(foundList[index]));
                      widget.textEditingController.clear();
                      Routes.seafarer.pop();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: widget.modifyListOutput(foundList[index]).text.size(Vx.dp16).make()
                        ),
                      ],
                    ),
                  );
                }
              )
            ],
          );
  }
}