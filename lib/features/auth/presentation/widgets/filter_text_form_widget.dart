import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/core/bloc/auth_bloc/auth_bloc.dart';
import '../../../../core/data/models/coupon_model.dart';
import '../../../../core/config/injectable/injection.dart';
import '../../../../core/config/theme/input_decoration_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/config/theme/global_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class FilterTextFormWidget extends StatefulWidget {
  final void Function(String?) onChange;

  const FilterTextFormWidget({Key? key, required this.onChange})
      : super(key: key);

  @override
  _FilterTextFormWidgetState createState() => _FilterTextFormWidgetState();
}

class _FilterTextFormWidgetState extends State<FilterTextFormWidget> {
  final TextEditingController _controller = TextEditingController();

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
    return Row(
          children: [
            Expanded(
                child: TextFormField(
                  onChanged: widget.onChange,
                    keyboardType: TextInputType.streetAddress,
                    cursorColor: GlobalTheme.kOrangeColor,
                    decoration: InputDecoration(
                      hintText: "Filter",
                      border: isDark(context) ? darkBorder : border,
                      errorBorder: isDark(context) ? darkBorder : border,
                      disabledBorder: isDark(context) ? darkBorder : border,
                      enabledBorder: isDark(context) ? darkBorder : border,
                      focusedBorder: focusedBorder,
                      focusedErrorBorder: focusedBorder,
                    ),
                    controller: _controller)),
            Container(
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
                  onPressed: () {},
                  icon: Icon(Icons.search_rounded, color: GlobalTheme.kOrangeColor)),
            )
          ],
        );
  }
}
