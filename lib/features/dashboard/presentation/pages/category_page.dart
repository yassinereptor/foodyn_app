import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/filter_text_form_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
import 'add_category_page.dart';

class CategoryPage extends StatefulWidget {
  static const kRouteName = "/category";

  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final faker = Faker.instance;
  String? _filter;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool _gridView = false;
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

  void _onRefresh() async {}

  void requestRefresh() {
    _refreshController.requestRefresh();
  }

  void _onListingTap() {
    setState(() {
      _gridView = !_gridView;
    });
  }

  void _onAddCategoryTap() async {
    var result = await Routes.seafarer.navigate(AddCategoryPage.kRouteName);
    if (result != null) requestRefresh();
  }

  void _onCategoryTap(int id) async {
    // var result = await Routes.seafarer.navigate(EateryPage.kRouteName, params: {
    //   "eateryModel": eateryModelList.singleWhere((element) => element.id == id)
    // });
    // if (result != null)
    // requestRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScaffoldContainerWidget(
          refresher: true,
          logout: false,
          title: "Category Manager",
          subtitle: "you can edit or delete a category by clicking it",
          refreshController: _refreshController,
          onRefresherRefresh: _onRefresh,
          leading: InkWell(
              onTap: _onListingTap,
              child: Icon(
                (_gridView) ? Icons.view_agenda : Icons.grid_view_rounded,
                size: 30,
                color: GlobalTheme.kOrangeColor,
              )),
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: FilterTextFormWidget(
                  onChange: (filter) {
                    if (filter != null) {
                      setState(() {
                        _filter = filter;
                      });
                    }
                  },
                )),
            if (_categoriesList.isNotEmpty)
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: (_gridView) ? 1 : 3,
              childAspectRatio: (_gridView) ? 3 / 1 : 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
              children: [
                ..._categoriesList
                .filter((element) =>
                    (_filter == null) ? true : element.contains(_filter!))
                .mapIndexed((e, index) => InkWell(
                  onTap: () => _onCategoryTap(index),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isDark(context) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor,
                    ),
                    child: (_gridView) ?
                     Row(
                      children: [
                        Expanded(
                          child: Padding(padding: EdgeInsets.only(left: 20, right: 20), 
                          child: e.text.xl.make(),),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 40) / 3,
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                                  child: CachedNetworkImage(
                                          imageUrl: faker.image.loremPicsum.image(),
                                          fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ) : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                  child: CachedNetworkImage(
                                          imageUrl: faker.image.loremPicsum.image(),
                                          fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), 
                        child: e.text.sm.make(),)
                      ],
                    ),
                  ),
                )).toList()
              ]
            ),
            // ..._categoriesList
            //     .filter((element) =>
            //         (_filter == null) ? true : element.contains(_filter!))
            //     .mapIndexed((e, index) => Padding(
            //       padding: EdgeInsets.only(bottom: 20),
            //       child: InkWell(
            //             onTap: () => _onCategoryTap(index),
            //             child: Container(
            //               height: 65,
            //               width: MediaQuery.of(context).size.width - 40,
            //               padding: EdgeInsets.only(left: 20, right: 20),
            //               decoration: BoxDecoration(
            //                   color: isDark(context)
            //                       ? GlobalTheme.kPrimaryLightColor
            //                       : GlobalTheme.kAccentDarkColor,
            //                   borderRadius: BorderRadius.circular(10)),
            //               child: Center(
            //                 child: Row(
            //                   children: [
            //                     e.text.make(),
            //                     Spacer(),
            //                     Icon(
            //                       Icons.qr_code_2_rounded,
            //                       size: 30,
            //                       color: GlobalTheme.kOrangeColor,
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //     ))
            //     .toList(),
            SizedBox(
              height: 65,
            )
          ],
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: FloatingActionButton(
              backgroundColor: GlobalTheme.kOrangeColor,
              child: Icon(
                Icons.add,
                color: isDark(context)
                    ? GlobalTheme.kPrimaryColor
                    : GlobalTheme.kAccentColor,
              ),
              onPressed: _onAddCategoryTap),
        )
      ],
    );
  }
}
