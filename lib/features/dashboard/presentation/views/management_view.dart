import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodyn_eatery/core/config/router/router.dart';
import 'package:foodyn_eatery/core/config/theme/global_theme.dart';
import 'package:foodyn_eatery/core/utils/color_utils.dart';
import 'package:foodyn_eatery/core/utils/theme_brightness.dart';
import 'package:foodyn_eatery/features/dashboard/data/models/menu_item_model.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/category_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/food_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/menu_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/qr_page.dart';
import 'package:velocity_x/velocity_x.dart';

class ManagementView extends StatefulWidget {
  const ManagementView({Key? key}) : super(key: key);

  @override
  _ManagementViewState createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView> {
  List<MenuItemModel> _menuItemList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _menuItemList = [
      new MenuItemModel(
          title: "Qr Code",
          icon: Icons.qr_code_2_rounded,
          backgroud: GlobalTheme.kOrangeColor,
          forground: isDark(context)
              ? GlobalTheme.kPrimaryColor
              : GlobalTheme.kAccentColor,
          onTap: () {
            Routes.seafarer.navigate(QrPage.kRouteName);
          }),
      new MenuItemModel(
          title: "Categories",
          icon: Icons.category_rounded,
          backgroud: GlobalTheme.kRedColor,
          forground: isDark(context)
              ? GlobalTheme.kPrimaryColor
              : GlobalTheme.kAccentColor,
          onTap: () {
            Routes.seafarer.navigate(CategoryPage.kRouteName);
          }),
      new MenuItemModel(
          title: "Menus",
          icon: Icons.menu_book_rounded,
          backgroud: GlobalTheme.kGreenColor,
          forground: isDark(context)
              ? GlobalTheme.kPrimaryColor
              : GlobalTheme.kAccentColor,
          onTap: () {
            Routes.seafarer.navigate(MenuPage.kRouteName);
          }),
      new MenuItemModel(
          title: "Foods",
          icon: Icons.fastfood_rounded,
          backgroud: GlobalTheme.kPaypalColor,
          forground: isDark(context)
              ? GlobalTheme.kPrimaryColor
              : GlobalTheme.kAccentColor,
          onTap: () {
            Routes.seafarer.navigate(FoodPage.kRouteName);
          })
    ];

    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 15),
              child: "Management".text.xl2.make(),
            ),
          ],
        ),
        StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 6,
          itemCount: _menuItemList.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: _menuItemList[index].onTap,
            child: new Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                      colors: [
                        ColorUtils.toLighten(
                            _menuItemList[index].backgroud!, .05),
                        _menuItemList[index].backgroud!,
                      ],
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _menuItemList[index].icon,
                      color: _menuItemList[index].forground,
                      size: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _menuItemList[index]
                        .title
                        .text
                        .bold
                        .color(_menuItemList[index].forground!)
                        .make()
                  ],
                )),
          ),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(3, index.isEven ? 4 : 3),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
      ],
    ));
  }
}
