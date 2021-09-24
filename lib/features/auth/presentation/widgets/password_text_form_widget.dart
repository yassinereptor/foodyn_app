import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/theme/input_decoration_theme.dart';
import '../../../../core/services/validator_service.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class PasswordTextFormWidget extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextFormWidget(
      {Key? key,
      required this.controller})
      : super(key: key);

  @override
  _PasswordTextFormWidgetState createState() => _PasswordTextFormWidgetState();
}

class _PasswordTextFormWidgetState extends State<PasswordTextFormWidget> {
  bool _obscureText = true;

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Vx.dp10),
        bottomLeft: Radius.circular(Vx.dp10)),
    borderSide: BorderSide(color: borderColor, width: 1),
  );
  final darkBorder = OutlineInputBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Vx.dp10),
        bottomLeft: Radius.circular(Vx.dp10)),
    borderSide: BorderSide(color: GlobalTheme.kPrimaryLightColor, width: 1),
  );
  final focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Vx.dp10),
        bottomLeft: Radius.circular(Vx.dp10)),
    borderSide: BorderSide(color: GlobalTheme.kOrangeColor, width: 1),
  );
  bool passErrCount = false;

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
              controller: widget.controller,
          obscureText: _obscureText,
          obscuringCharacter: "●",
          cursorColor: GlobalTheme.kOrangeColor,
          decoration: InputDecoration(
            hintText: "Password",
            border: isDark(context) ? darkBorder : border,
            errorBorder: isDark(context) ? darkBorder : border,
            disabledBorder: isDark(context) ? darkBorder : border,
            enabledBorder: isDark(context) ? darkBorder : border,
            focusedBorder: focusedBorder,
            focusedErrorBorder: focusedBorder,
          ),
          validator: (value) {
            String? ret = ValidatorService.passwordValidator(value);
            setState(() {
              passErrCount = (ret != null);
            });
            return ret;
          },
        )),
        Container(
          margin: EdgeInsets.only(bottom: (passErrCount) ? 20 : 0),
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Vx.dp10),
                bottomRight: Radius.circular(Vx.dp10)),
            color: isDark(context)
                ? GlobalTheme.kAccentDarkColor
                : GlobalTheme.kPrimaryLightColor,
          ),
          child: IconButton(
              onPressed: _toggleObscure,
              icon: Icon(
                (_obscureText) ? Icons.visibility : Icons.visibility_off,
                color: GlobalTheme.kOrangeColor,
              )),
        )
      ],
    );
  }
}
