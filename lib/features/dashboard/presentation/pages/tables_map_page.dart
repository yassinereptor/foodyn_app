import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_rest/core/data/models/section_model.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/pages/interactive_tables_map_page.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/table_form_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/text_form_range_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class TablesMapPage extends StatefulWidget {
  static const kRouteName = "/tables-map";

  const TablesMapPage({Key? key}) : super(key: key);

  @override
  _TablesMapPageState createState() => _TablesMapPageState();
}

class _TablesMapPageState extends State<TablesMapPage> {
  List<SectionModel> sectionList = [];
  List<ExpandableController> expandableControllerList = [];
  bool editMode = false;
  bool formMode = false;

  @override
  void initState() {
    super.initState();
  }

  void _onComplete() {
    Routes.seafarer.pop([sectionList]);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldContainerWidget(
      logout: false,
      title: "Tables Map",
      children: [
        ...sectionList.mapIndexed((sectionModel, index) {
          return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              ExpandablePanel(
                controller: expandableControllerList[index],
                header: Row(
                  children: [
                    "Section:".text.xl.make(),
                    SizedBox(width: 10,),
                    sectionModel.title!.text.bold.xl.make()
                  ],
                ),
                collapsed: Container(
                ),
                expanded: TableFormWidget(
                  sectionModel: sectionModel,
                  onComplete: (sectionItem) {
                    if (sectionItem != null)
                      setState(() {
                        sectionList[index] = sectionItem;
                      });
                  },
                  onDelete: () {
                    setState(() {
                      sectionList.removeAt(index);
                      expandableControllerList.removeAt(index);
                    });
                  },
                ),
                theme: ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  iconSize: 30,
                  iconColor: isDark(context) ? GlobalTheme.kAccentColor : GlobalTheme.kPrimaryColor
                ),
              ),
              SizedBox(height: 10,),
              Divider(height: 0)
            ],
          ),
        );
        }),
        if (editMode)
        TableFormWidget(
          onComplete: (sectionModel) {
              setState(() {
                if (sectionModel != null)
                {
                  sectionList.add(sectionModel);
                  expandableControllerList.add(ExpandableController());
                }
                editMode = false;
              });
          }
        ),
        if (!expandableControllerList.any((element) {
          return element.expanded;}) && !editMode)
        Column(
          children: [
            ButtonWidget(
          onTap: () => setState(() => editMode = true),
          background: isDark(context) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor,
          children: [
            "Add Section"
            .text
            .xl
            .color((isDark(context))
                ? GlobalTheme.kAccentColor
                : GlobalTheme.kPrimaryColor)
            .make(),
          ],
        ),
        if (sectionList.isNotEmpty)
        SizedBox(
              height: 20,
            ),
        if (sectionList.isNotEmpty)
        ButtonWidget(
          onTap: _onComplete,
          children: [
            "Confirm"
                .text
                .xl
                .color((isDark(context))
                    ? GlobalTheme.kPrimaryColor
                    : GlobalTheme.kAccentColor)
                .make(),
          ],
        ),
          ],
        )
      ],
    );
  }
}
