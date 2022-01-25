import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/config/router/router.dart';
import 'package:foodyn_eatery/core/config/theme/global_theme.dart';
import 'package:foodyn_eatery/core/data/models/eatery_model.dart';
import 'package:foodyn_eatery/core/utils/color_utils.dart';
import 'package:foodyn_eatery/core/utils/theme_brightness.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/add_eatery_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/add_user_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/show_all_eateries_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/widgets/global_statistics_section_widget.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/widgets/transition_image_widget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:faker_dart/faker_dart.dart';

class OverviewView extends StatefulWidget {
  final List<EateryModel> eateryModelList;
  final void Function()? requestRefresh;
  final void Function() showAllEateriesTap;
  final void Function(int) onEateryTap;

  const OverviewView({Key? key, 
  required this.eateryModelList,
  this.requestRefresh,
  required this.showAllEateriesTap,
  required this.onEateryTap
  })
      : super(key: key);

  @override
  _OverviewViewState createState() => _OverviewViewState();
}

class _OverviewViewState extends State<OverviewView> {
  final faker = Faker.instance;

  void _onAddEateryTap() async {
    var result = await Routes.seafarer.navigate(AddEateryPage.kRouteName);
    if (widget.requestRefresh != null && result != null)
      widget.requestRefresh!();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 15),
              child: "Overview".text.xl2.make(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 15),
          child: Row(
            children: [
              "Eateries".text.xl.make(),
              Spacer(),
              InkWell(
                onTap: widget.showAllEateriesTap,
                child: "See All".text.xl.color(GlobalTheme.kOrangeColor).make(),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: _onAddEateryTap,
                child: Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalTheme.kAccentDarkColor,
                  ),
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: GlobalTheme.kAccentColor),
                        child: Center(
                          child: Icon(
                            Icons.add_rounded,
                            color: GlobalTheme.kOrangeColor,
                            size: 30,
                          ),
                        ),
                      ),
                      Spacer(),
                      "Add".text.make()
                    ],
                  ),
                ),
              ),
              ...widget.eateryModelList
                  .map(
                    (eatery) => TransitionImageWidget(
                      onTap: widget.onEateryTap,
                      id: eatery.id!,
                      links: eatery.images,
                      title: eatery.title!,
                      size: Size(150, 100),
                    ),
                  )
                  .toList()
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 15),
          child: Row(
            children: [
              "Users".text.xl.make(),
              Spacer(),
              InkWell(
                child: "See All".text.xl.color(GlobalTheme.kOrangeColor).make(),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: () => Routes.seafarer.navigate(AddUserPage.kRouteName),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: GlobalTheme.kAccentDarkColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add_rounded,
                      color: GlobalTheme.kOrangeColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
              for (var i = 1; i < 15; i++)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () =>
                        Routes.seafarer.navigate(AddEateryPage.kRouteName),
                    child: Stack(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: GlobalTheme.kAccentDarkColor,
                            ),
                            child: ClipRRect(
                              child: CachedNetworkImage(
                                  imageUrl: faker.image.loremPicsum.image(),
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50),
                              borderRadius: BorderRadius.circular(50.0),
                            )),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: GlobalTheme.kGreenColor,
                                shape: BoxShape.circle),
                            height: 15,
                            width: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 15),
          child: Row(
            children: [
              "News & Articles".text.xl.make(),
              Spacer(),
              InkWell(
                child: "See All".text.xl.color(GlobalTheme.kOrangeColor).make(),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(),
                child: InkWell(
                  onTap: () =>
                      Routes.seafarer.navigate(AddEateryPage.kRouteName),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: GlobalTheme.kRedColor,
                    ),
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child:
                          "How to gwoth you bussiness even more geater than he is"
                              .text
                              .maxLines(3)
                              .overflow(TextOverflow.ellipsis)
                              .color(GlobalTheme.kAccentColor)
                              .make(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () =>
                      Routes.seafarer.navigate(AddEateryPage.kRouteName),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: GlobalTheme.kGreenColor,
                    ),
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child:
                          "How to gwoth you bussiness even more geater than he is"
                              .text
                              .maxLines(3)
                              .overflow(TextOverflow.ellipsis)
                              .color(GlobalTheme.kAccentColor)
                              .make(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            children: [
              "Capacity (Global)".text.xl.make(),
              Spacer(),
              InkWell(
                child: "More".text.xl.color(GlobalTheme.kOrangeColor).make(),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Center(
                child: SleekCircularSlider(
                  initialValue: 90,
                  innerWidget: (value) => Center(
                    child: Text(
                      value.round().toString() + " %",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                    ),
                  ),
                  appearance: CircularSliderAppearance(
                      angleRange: 360,
                      startAngle: 270,
                      size: 150,
                      customWidths: CustomSliderWidths(
                        progressBarWidth: 10,
                        shadowWidth: 0,
                      ),
                      customColors: CustomSliderColors(
                          progressBarColors: [
                            GlobalTheme.kOrangeColor,
                            ColorUtils.toLighten(GlobalTheme.kOrangeColor)
                          ],
                          trackColor: isDark(context)
                              ? GlobalTheme.kPrimaryLightColor
                              : GlobalTheme.kAccentDarkColor)),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Center(
                child: Row(
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            "Available: ".text.make(),
                            "200".text.bold.make(),
                          ],
                        ),
                        Row(
                          children: [
                            "Filled: ".text.make(),
                            "180".text.bold.make(),
                          ],
                        ),
                        Row(
                          children: [
                            "Empty: ".text.make(),
                            "10".text.bold.make(),
                          ],
                        ),
                        Row(
                          children: [
                            "Reserved: ".text.make(),
                            "10".text.bold.make(),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            children: [
              "Statistics (Global)".text.xl.make(),
              Spacer(),
              InkWell(
                child: "More".text.xl.color(GlobalTheme.kOrangeColor).make(),
              ),
            ],
          ),
        ),
        GlobalStatisticsSectionWidget()
      ],
    ));
  }
}
