import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_eatery/features/dashboard/data/models/image_item_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class CategoryIconPackagePage extends StatefulWidget {
  static const kRouteName = "/category-icon-package";

  const CategoryIconPackagePage({Key? key}) : super(key: key);

  @override
  _CategoryIconPackagePageState createState() => _CategoryIconPackagePageState();
}

class _CategoryIconPackagePageState extends State<CategoryIconPackagePage> {
  final faker = Faker.instance;
  List<String> _categoriesList = [
    "Hello1",
    "Hello1",
    "Hello1",
    "Hello2",
    "Hello1",
    "Hello1",
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onCategoryTap(int iconPackIndex, int index) {

  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldContainerWidget(
      logout: false,
      title: "Category Icon Packages",
      subtitle: "select any image from any pack",
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDark(context) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor,
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom: 20),
              child: "Package Name".text.make(),),
              if (_categoriesList.isNotEmpty)
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
              children: [
                ..._categoriesList
                .mapIndexed((e, index) => InkWell(
                  onTap: () => _onCategoryTap(0, index),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isDark(context) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                          imageUrl: faker.image.loremPicsum.image(),
                                          fit: BoxFit.cover,),
                                )
                        ),
                      ],
                    ),
                  ),
                )).toList()
              ]
            ),
            ],
          ),
        )
      ],
    );
  }
}
