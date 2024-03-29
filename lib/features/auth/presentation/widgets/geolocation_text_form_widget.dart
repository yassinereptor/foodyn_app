import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/theme/input_decoration_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class GeolocationTextFormWidget extends StatefulWidget {
  final void Function()? onTap;
  final TextEditingController? controller;

  const GeolocationTextFormWidget(
      {Key? key,
      this.controller,
      required this.onTap})
      : super(key: key);

  @override
  _GeolocationTextFormWidgetState createState() => _GeolocationTextFormWidgetState();
}

class _GeolocationTextFormWidgetState extends State<GeolocationTextFormWidget> {
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
              keyboardType: TextInputType.streetAddress,
          cursorColor: GlobalTheme.kOrangeColor,
          decoration: InputDecoration(
            hintText: "Adresse",
            border: isDark(context) ? darkBorder : border,
            errorBorder: isDark(context) ? darkBorder : border,
            disabledBorder: isDark(context) ? darkBorder : border,
            enabledBorder: isDark(context) ? darkBorder : border,
            focusedBorder: focusedBorder,
            focusedErrorBorder: focusedBorder,
          ),
          validator: (value) {
            // if (value == null || value.isEmpty) {
            //   setState(() {
            //     passErrCount = true;
            //   });
            //   return '● Please enter some text';
            // }
            // setState(() {
            //   passErrCount = false;
            // });
            return null;
          },
          controller: (widget.controller == null) ? TextEditingController() : widget.controller
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
              onPressed: widget.onTap,
              icon: Icon(
                Icons.map_rounded,
                color: GlobalTheme.kOrangeColor,
              )),
        )
      ],
    );
  }
}
