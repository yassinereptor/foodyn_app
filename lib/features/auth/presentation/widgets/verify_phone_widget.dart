import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/input_decoration_theme.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class VerifyPhoneWidget extends StatefulWidget {
  final String? Function(String?) validator;
  final void Function(String?) onChanged;
  final void Function(String?) onCompleted;
  final int length;

  const VerifyPhoneWidget(
      {Key? key,
      required this.onCompleted,
      required this.length,
      required this.onChanged,
      required this.validator})
      : super(key: key);

  @override
  _VerifyPhoneWidgetState createState() => _VerifyPhoneWidgetState();
}

class _VerifyPhoneWidgetState extends State<VerifyPhoneWidget> {
  List<TextEditingController> _textEditingController = [];
  List<FocusNode> _focusNode = [];
  List<Widget> _widgets = [];
  String _currentPin = "";
  late List<String> _otp;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.length; i++) {
      _textEditingController.add(TextEditingController());
      _focusNode.add(FocusNode());
      _widgets.add(Expanded(
        child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                focusNode: _focusNode[i],
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
                onChanged: (text) => _onChange(text, i),
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: true),
                cursorColor: GlobalTheme.kOrangeColor,
                decoration: InputDecoration(
                  hintText: "",
                  counterText: "",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                controller: _textEditingController[i],
                validator: widget.validator)),
      ));
      if (i < widget.length - 1)
        _widgets.add(SizedBox(
          width: 10,
        ));
    }
    _focusNode[0].requestFocus();
    _otp = List.generate(widget.length, (int i) {
      return '';
    });
  }

  @override
  void dispose() {
    _textEditingController
        .forEach((TextEditingController? controller) => controller!.dispose());
    super.dispose();
  }

  void _onChange(text, index) {
    if (text.length > 1) {
      _handlePaste(text);
      return;
    }

    // Check if the current value at this position is empty
    // If it is move focus to previous text field.
    if (text.isEmpty) {
      if (index == 0) return;
      _focusNode[index].unfocus();
      _focusNode[index - 1].requestFocus();
    }

    // Update the current otp
    setState(() {
      _otp[index] = text;
    });

    // Remove focus
    if (text.isNotEmpty) _focusNode[index].unfocus();
    // Set focus to the next field if available
    if (index + 1 != widget.length && text.isNotEmpty)
      FocusScope.of(context).requestFocus(_focusNode[index + 1]);

    String currentPin = _otp.join();

    // if there are no null values that means otp is completed
    // Call the `onCompleted` callback function provided
    if (!_otp.contains(null) &&
        !_otp.contains('') &&
        currentPin.length == widget.length) {
      widget.onCompleted(currentPin);
    }

    // Call the `onChanged` callback function
    widget.onChanged(_currentPin);
  }

  void _handlePaste(text) {
    if (text.length > widget.length) {
      text = text.substring(0, widget.length);
    }

    for (int i = 0; i < text.length; i++) {
      String digit = text.substring(i, i + 1);
      _textEditingController[i].text = digit;
      _otp[i] = digit;
    }

    FocusScope.of(context).requestFocus(_focusNode[widget.length - 1]);

    String currentPin = _otp.join();

    // if there are no null values that means otp is completed
    // Call the `onCompleted` callback function provided
    if (!_otp.contains(null) &&
        !_otp.contains('') &&
        currentPin.length == widget.length) {
      widget.onCompleted(currentPin);
    }

    // Call the `onChanged` callback function
    widget.onChanged(currentPin);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _widgets,
    );
  }
}
