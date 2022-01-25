import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/config/theme/global_theme.dart';
import 'package:foodyn_eatery/core/utils/theme_brightness.dart';
import 'package:foodyn_eatery/features/dashboard/data/models/menu_item_model.dart';
import 'package:velocity_x/velocity_x.dart';

import 'line_chart_widget.dart';

class GlobalStatisticsSectionWidget extends StatefulWidget {
  const GlobalStatisticsSectionWidget({Key? key}) : super(key: key);

  @override
  _SideMenuWidgetState createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<GlobalStatisticsSectionWidget> {
  late PageController _pageController;
  late int _selectedIndex;

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);
    _selectedIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(),
                child: InkWell(
                  onTap: () => _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuart),
                  child: "Income"
                    .text
                    .color((_selectedIndex == 0)
                        ? GlobalTheme.kOrangeColor
                        : (Colors.grey.shade500))
                    .xl
                    .make(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () => _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuart),
                  child: "Clients"
                    .text
                    .color((_selectedIndex == 1)
                        ? GlobalTheme.kOrangeColor
                        : (Colors.grey.shade500))
                    .xl
                    .make(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () => _pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuart),
                  child: "Orders"
                    .text
                    .color((_selectedIndex == 2)
                        ? GlobalTheme.kOrangeColor
                        : (Colors.grey.shade500))
                    .xl
                    .make(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: isDark(context)
                  ? GlobalTheme.kPrimaryLightColor
                  : GlobalTheme.kAccentDarkColor,
            ),
            child: PageView(
              onPageChanged: (index) => setState(() => _selectedIndex = index),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: [
                LineChartWidget(),
                LineChartWidget(),
                LineChartWidget(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
