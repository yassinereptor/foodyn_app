import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/theme/global_theme.dart';


class TextFormWidget extends StatefulWidget {
  final String hint;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final void Function(String?) onChanged;
  final TextInputType keyboardType;
  final int? maxLength;

  const TextFormWidget({Key? key, this.maxLength, required this.hint, required this.validator, this.controller, required this.onChanged, this.keyboardType = TextInputType.text}) : super(key: key);

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
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      controller: (widget.controller == null) ? TextEditingController() : widget.controller,
      keyboardType: widget.keyboardType,
      cursorColor: GlobalTheme.kOrangeColor,
      decoration: InputDecoration(hintText: widget.hint, counterText: ""),
      validator: widget.validator);
  }
}
