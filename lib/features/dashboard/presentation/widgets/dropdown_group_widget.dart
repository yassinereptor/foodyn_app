import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/dropdown_form_widget.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/add_group_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class DropdownGroupWidget extends StatefulWidget {
  final void Function(String, int) onSelect;
  final int defaultIndex;

  const DropdownGroupWidget({
    Key? key,
    required this.onSelect,
    required this.defaultIndex,
    }) : super(key: key);

  @override
  _DropdownGroupWidgetState createState() => _DropdownGroupWidgetState();
}

class _DropdownGroupWidgetState extends State<DropdownGroupWidget> {
  List<String> _typeList = [
    "Admin"
  ];

  @override
  void initState() {
    super.initState();
  }

  void _addGroup() {
    Routes.seafarer.navigate(AddGroupPage.kRouteName);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownFormWidget(
            onSelect: widget.onSelect,
            list: _typeList,
            hint: "Group",
            defaultIndex: widget.defaultIndex,
            modifyListOutput: (text) => text,
            modifySelectedOutput: (text) => text,
            searchForm: true,
            rightRadius: false,
          ),
        ),
        Container(
          margin: EdgeInsets.only(),
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
              onPressed: _addGroup,
              icon: Icon(
                Icons.add,
                color: GlobalTheme.kOrangeColor,
              )),
        )
      ],
    );
  }
}
