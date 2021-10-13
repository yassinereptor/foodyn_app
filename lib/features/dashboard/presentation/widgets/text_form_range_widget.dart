import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class TextFormRangeWidget extends StatefulWidget {
  final int min;
  final int max;
  final TextEditingController controller;
  final void Function(String?)? onChanged;
  final void Function(int)? onAdd;
  final void Function(int)? onRemove;
  final String? Function(String?)? validator;

  const TextFormRangeWidget(
      {Key? key,
      required this.min,
      required this.max,
      required this.controller,
      this.onChanged,
      this.onAdd,
      this.onRemove,
      this.validator})
      : super(key: key);

  @override
  _TextFormRangeWidgetState createState() => _TextFormRangeWidgetState();
}

class _TextFormRangeWidgetState extends State<TextFormRangeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            int value = int.parse(widget.controller.text);
            if (value > widget.min) {
              setState(() {
                value--;
                widget.controller.text = value.toString();
              });
              if (widget.onChanged != null)
                  widget.onChanged!(widget.controller.text);
              if (widget.onRemove != null)
                  widget.onRemove!(int.parse(widget.controller.text));
            }
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark(context)
                    ? GlobalTheme.kPrimaryLightColor
                    : GlobalTheme.kAccentDarkColor),
            child: Center(
              child: Icon(
                Icons.remove,
                color: GlobalTheme.kOrangeColor,
                size: 30,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormWidget(
            readOnly: true,
            onChanged: widget.onChanged == null ? (_) {} : widget.onChanged!,
            hint: "",
            keyboardType: TextInputType.number,
            validator: (value) {
              if (widget.validator != null)
              {  var ret = widget.validator!(value);
                                  print(ret);
                                  return ret;
              }
              return null;
            },
            controller: widget.controller,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            int value = int.parse(widget.controller.text);
            if (value < widget.max) {
              setState(() {
                value++;
                widget.controller.text = value.toString();
                if (widget.onChanged != null)
                  widget.onChanged!(widget.controller.text);
                if (widget.onAdd != null)
                  widget.onAdd!(int.parse(widget.controller.text));
              });
            }
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark(context)
                    ? GlobalTheme.kPrimaryLightColor
                    : GlobalTheme.kAccentDarkColor),
            child: Center(
              child: Icon(
                Icons.add_rounded,
                color: GlobalTheme.kOrangeColor,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }
}
