import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/services/validator_service.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/dropdown_form_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_eatery/features/dashboard/data/models/tag_item_model.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/widgets/dropdown_group_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class AddGroupPage extends StatefulWidget {
  static const kRouteName = "/add-group";

  const AddGroupPage({Key? key}) : super(key: key);

  @override
  _AddGroupPageState createState() => _AddGroupPageState();
}

class _AddGroupPageState extends State<AddGroupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTextEditingController =
      TextEditingController();
  List<TagItemModel> ruleItemList = [];
  List<TagItemModel> addRuleItemList = [];

  @override
  void initState() {
    ruleItemList.add(new TagItemModel(
        id: 0,
        title: "Overview",
        grade: 0,
        background: GlobalTheme.kRedColor,
        color: GlobalTheme.kAccentColor));
    ruleItemList.add(new TagItemModel(
        id: 1,
        title: "Analysis",
        grade: 0,
        background: GlobalTheme.kRedColor,
        color: GlobalTheme.kAccentColor));
    ruleItemList.add(new TagItemModel(
        id: 2,
        title: "QR create",
        grade: 2,
        background: GlobalTheme.kTransferColor,
        color: GlobalTheme.kAccentColor));
    ruleItemList.add(new TagItemModel(
        id: 3,
        title: "Add Users",
        grade: 1,
        background: GlobalTheme.kGreenColor,
        color: GlobalTheme.kAccentColor));
    ruleItemList.add(new TagItemModel(
        id: 4,
        title: "Add Eateries",
        grade: 1,
        background: GlobalTheme.kGreenColor,
        color: GlobalTheme.kAccentColor));
    ruleItemList.add(new TagItemModel(
        id: 5,
        title: "Settings",
        grade: 0,
        background: GlobalTheme.kRedColor,
        color: GlobalTheme.kAccentColor));
    ruleItemList.add(new TagItemModel(
        id: 6,
        title: "Menus",
        grade: 1,
        background: GlobalTheme.kGreenColor,
        color: GlobalTheme.kAccentColor));
    super.initState();
  }

  void _onComplete() {
    FocusScope.of(context).requestFocus(FocusNode());

  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldContainerWidget(
      logout: false,
      title: "Add Group",
      children: [
        Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormWidget(
                        onChanged: (_) {},
                        hint: "Title *",
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '● Please enter title';
                          }
                          return null;
                        },
                        controller: _titleTextEditingController,
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryLightColor
                                : GlobalTheme.kAccentDarkColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: addRuleItemList.isEmpty ?
                        Center(
                          child: "Add one or more rules to the group".text.sm.make(),
                        ) :
                        Wrap(
                          runSpacing: 10, spacing: 10, 
                          children: [
                          ...addRuleItemList.map((e) => Container(
                                height: 40,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: e.background,
                                    borderRadius: BorderRadius.circular(10)),
                                child: 
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        e.title.text.sm.bold.color(e.color).make(),
                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            ruleItemList.add(e);
                                            addRuleItemList.remove(e);
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: e.color,
                                          size: 30,
                                        ))
                                  ],
                                ),
                              ))
                        ]),
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        child: Wrap(runSpacing: 10, spacing: 10, children: [
                          ...ruleItemList.map((e) => InkWell(
                                onTap: () {
                                  setState(() {
                                    addRuleItemList.add(e);
                                    ruleItemList.remove(e);
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      color: e.background,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      e.title.text.sm.bold.color(e.color).make(),
                                    ],
                                  ),
                                ),
                              ))
                        ]),
                      )),
                  ButtonWidget(
                    onTap: _onComplete,
                    children: [
                      "Add"
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
          ],
        )
      ],
    );
  }
}
