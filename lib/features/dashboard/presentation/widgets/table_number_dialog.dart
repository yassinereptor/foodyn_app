import 'dart:ui';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/config/router/router.dart';
import 'package:foodyn_eatery/core/config/theme/global_theme.dart';
import 'package:foodyn_eatery/core/utils/theme_brightness.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/widgets/text_form_range_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class TableNumberDialog extends StatefulWidget {
  final int number;
  final int index;
  final List<int> numbers;
  final void Function(int) onRemoveTable;

  const TableNumberDialog(
      {Key? key,
      required this.number,
      required this.index,
      required this.numbers,
      required this.onRemoveTable})
      : super(key: key);

  @override
  _TableNumberDialogState createState() => _TableNumberDialogState();
}

class _TableNumberDialogState extends State<TableNumberDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numberTextEditingController = TextEditingController();
  bool _errPos = false;
  List<int> _numbers = [];

  @override
  void initState() {
    _numberTextEditingController.text = widget.number.toString();
    _numbers.addAll(widget.numbers);
    _numbers.remove(widget.number);
    super.initState();
  }

  void _onComplete() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState!.validate()) {
      int number = int.parse(_numberTextEditingController.text);
      Routes.seafarer.pop([number]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          insetPadding: Vx.m0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: isDark(context)
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        color: isDark(context)
                            ? GlobalTheme.kPrimaryColor
                            : GlobalTheme.kAccentColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonWidget(
                          background: GlobalTheme.kRedColor,
                          onTap: () {
                            widget.onRemoveTable(widget.index);
                            Routes.seafarer.pop();
                          },
                          children: [
                            "Delete"
                                .text
                                .xl
                                .color((isDark(context))
                                    ? GlobalTheme.kPrimaryColor
                                    : GlobalTheme.kAccentColor)
                                .make(),
                            SizedBox(width: 10,),
                            Icon(Icons.delete, size: 30, color: (isDark(context))
                                    ? GlobalTheme.kPrimaryColor
                                    : GlobalTheme.kAccentColor,),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormRangeWidget(
                          min: 1,
                          max: 10000,
                          controller: _numberTextEditingController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          validator: (text) {
                            if (_numbers.contains(int.parse(text!))) {
                              setState(() {
                                _errPos = true;
                              });
                              return "● Number exist";
                            }
                            setState(() {
                              _errPos = false;
                            });
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonWidget(
                          onTap: _onComplete,
                          children: [
                            "Modify"
                                .text
                                .xl
                                .color((isDark(context))
                                    ? GlobalTheme.kPrimaryColor
                                    : GlobalTheme.kAccentColor)
                                .make(),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonWidget(
                          background: GlobalTheme.kRedColor,
                          onTap: () => Routes.seafarer.pop(),
                          children: [
                            "Cancel"
                                .text
                                .xl
                                .color((isDark(context))
                                    ? GlobalTheme.kPrimaryColor
                                    : GlobalTheme.kAccentColor)
                                .make(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
