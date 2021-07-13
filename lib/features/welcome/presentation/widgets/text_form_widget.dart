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


class TextFormWidget extends StatefulWidget {
  final String hint;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final void Function(String?) onChanged;
  final TextInputType keyboardType;

  const TextFormWidget({Key? key, required this.hint, required this.validator, this.controller = null, required this.onChanged, this.keyboardType = TextInputType.text}) : super(key: key);

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
                          controller: (widget.controller == null) ? TextEditingController() : widget.controller,
                          keyboardType: widget.keyboardType,
                          cursorColor: GlobalTheme.kOrangeColor,
                          decoration: InputDecoration(hintText: widget.hint),
                          validator: widget.validator);
  }
}
