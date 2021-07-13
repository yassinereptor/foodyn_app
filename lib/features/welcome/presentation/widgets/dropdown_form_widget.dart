import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/splash/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math' as math;

class DropdownFormWidget extends StatefulWidget {
  final List<String> list;
  final int defaultIndex;
  final void Function(int?) onSelect;
  final String Function(String) modifySelectedOutput;
  final String Function(String) modifyListOutput;

  const DropdownFormWidget({Key? key,
  required this.modifySelectedOutput, required this.modifyListOutput, required this.list, this.defaultIndex = 0, required this.onSelect}) : super(key: key);

  @override
  _DropdownFormWidgetState createState() => _DropdownFormWidgetState();
}

class _DropdownFormWidgetState extends State<DropdownFormWidget> {

  late int index;

  @override
  void initState() {
    
    super.initState();
  }

   @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    index = widget.defaultIndex;

    return Container(
        constraints: BoxConstraints(maxHeight: 65),
        decoration: BoxDecoration(
          color: GlobalTheme.kAccentDarkColor,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            widget.modifySelectedOutput(widget.list[index]).text.size(Vx.dp16).make(),
            SizedBox(width: 3,),
            Icon(Icons.unfold_more)
          ],
        ),
      );
  }

}
