import 'dart:typed_data';
import 'dart:ui';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodyn_eatery/core/bloc/auth_bloc/auth_bloc.dart';
import 'package:foodyn_eatery/core/bloc/config_bloc/config_bloc.dart';
import 'package:foodyn_eatery/core/bloc/managment_bloc/management_bloc.dart';
import 'package:foodyn_eatery/core/data/models/eatery_model.dart';
import 'package:foodyn_eatery/core/domain/entities/app_failure.dart';
import 'package:foodyn_eatery/core/utils/string_utils.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:image/image.dart' as image;

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
import 'add_eatery_page.dart';
import 'image_view_page.dart';

class EateryPage extends StatefulWidget {
  static const kRouteName = "/eatery";
  final EateryModel eateryModel;

  const EateryPage({Key? key, required this.eateryModel}) : super(key: key);

  @override
  _EateryPageState createState() => _EateryPageState();
}

class _EateryPageState extends State<EateryPage> {
  late EateryModel eateryModel;
  late AuthBloc _authBloc;
  late ConfigBloc _configBloc;
  late ManagementBloc _managementBloc;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<EateryModel> eateryModelList = [];
  late String _token;
  late GoogleMapController _mapController;

  @override
  void initState() {
    eateryModel = widget.eateryModel;
    _managementBloc = context.read<ManagementBloc>();
    _authBloc = context.read<AuthBloc>();
    _configBloc = context.read<ConfigBloc>();
    _token = _authBloc.state.token!;
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onRefresh() async {
    _managementBloc.add(ManagementEvent.getEatery(eateryModel.id!));
  }

  void _onStateLoadingInProgress() {}

  void _onStateLoadingSuccess() {
    setState(() {
      if (_managementBloc.state.eateries != null) {
        eateryModelList = _managementBloc.state.eateries!;
        eateryModel =
            eateryModelList.singleWhere((e) => e.id! == eateryModel.id!);
      }
    });
    if (_refreshController.isRefresh) _refreshController.refreshCompleted();
  }

  void _onStateLoadingFailure(AppFailure failure) {
    if (_refreshController.isRefresh) _refreshController.refreshFailed();
  }

  void requestRefresh() {
    _refreshController.requestRefresh();
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  void _onEditTap() async {
    var result = await Routes.seafarer.navigate(AddEateryPage.kRouteName);
    if (result != null)
      requestRefresh();
  }

  @override
  Widget build(BuildContext context) {
  double rate = 4.5;

    return MultiBlocListener(
      listeners: [
        BlocListener<ManagementBloc, ManagementState>(
          listener: (context, state) {
            state.type.maybeWhen(
                loadingInProgress: _onStateLoadingInProgress,
                loadingSuccess: _onStateLoadingSuccess,
                loadingFailed: _onStateLoadingFailure,
                orElse: () {});
          },
        )
      ],
      child: ScaffoldContainerWidget(
        refresher: true,
        logout: false,
        title: eateryModel.title,
        refreshController: _refreshController,
        onRefresherRefresh: _onRefresh,
        leading: InkWell(
            onTap: _onEditTap,
            child: Icon(
              Icons.edit_rounded,
              size: 30,
              color: GlobalTheme.kOrangeColor,
            )),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryLightColor
                                : GlobalTheme.kAccentDarkColor,
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryColor
                                : GlobalTheme.kAccentColor,
                          ),
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Icon(Icons.person,
                                color: GlobalTheme.kOrangeColor, size: 30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      "Users".text.sm.bold.make(),
                    ],
                  ),
                ),
                InkWell(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryLightColor
                                : GlobalTheme.kAccentDarkColor,
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryColor
                                : GlobalTheme.kAccentColor,
                          ),
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Icon(Icons.menu_book_rounded,
                                color: GlobalTheme.kOrangeColor, size: 30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      "Menus".text.sm.bold.make(),
                    ],
                  ),
                ),
                InkWell(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryLightColor
                                : GlobalTheme.kAccentDarkColor,
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryColor
                                : GlobalTheme.kAccentColor,
                          ),
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Icon(Icons.bar_chart,
                                color: GlobalTheme.kOrangeColor, size: 30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      "Analysis".text.sm.bold.make(),
                    ],
                  ),
                ),
                InkWell(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryLightColor
                                : GlobalTheme.kAccentDarkColor,
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDark(context)
                                ? GlobalTheme.kPrimaryColor
                                : GlobalTheme.kAccentColor,
                          ),
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Icon(Icons.history,
                                color: GlobalTheme.kOrangeColor, size: 30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      "History".text.sm.bold.make(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (eateryModel.images != null && eateryModel.images!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CarouselSlider(
                  items: eateryModel.images!
                      .map((eateryImage) => InkWell(
                            onTap: () => Routes.seafarer.navigate(
                                ImageViewPage.kRouteName,
                                params: {"imageModel": eateryImage}),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: CachedNetworkImage(
                                imageUrl: dotenv.env["SERVER_LINK"]! +
                                    eateryImage.filepath! +
                                    eateryImage.filename!,
                                httpHeaders: {
                                  "Authorization": "Bearer $_token"
                                },
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
          // if (eateryModel.description != null &&
          //     eateryModel.description!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Rate".text.bold.make(),
                      Row(
                        children: [
                          for (var i = 0; i < 5; i++)
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: GlobalTheme.kOrangeColor, width: 1)
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: (i + 1 <= rate || (rate / i != 1.0 && i + 1 <= rate.ceil())) ? GlobalTheme.kOrangeColor : Colors.transparent,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
                                  )
                                ),
                                Container(
                                  height: 20,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: (i + 1 <= rate) ? GlobalTheme.kOrangeColor : Colors.transparent,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
                                  )
                                )
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (eateryModel.description != null &&
              eateryModel.description!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Description".text.bold.make(),
                      eateryModel.description!.text.make(),
                    ],
                  ),
                ],
              ),
            ),
          if (eateryModel.eateryTypes != null &&
              eateryModel.eateryTypes!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Types".text.bold.make(),
                      SizedBox(height: 10,),
                      Wrap(runSpacing: 10, spacing: 10, children: [
                        ...eateryModel.eateryTypes!.map((e) => Container(
                              height: 40,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: GlobalTheme.kOrangeColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StringUtils.getTranslatedString(
                                          _configBloc.state.locale!, e.title!)
                                      .text
                                      .sm
                                      .bold
                                      .color(GlobalTheme.kAccentColor)
                                      .make(),
                                ],
                              ),
                            ))
                      ]),
                    ],
                  ),
                ],
              ),
            ),
            if (eateryModel.phoneNumber != null &&
              eateryModel.phoneNumber!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Phone Number".text.bold.make(),
                      Row(
                        children: [
                          "MA (+212) ".text.make(),
                          eateryModel.phoneNumber!.text.make(),
                          if (eateryModel.phoneNumberVerified!)
                          " (Unverified)".text.make()
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Country".text.bold.make(),
                      "Morocco".text.make(),
                    ],
                  ),
                ],
              ),
            ),
            if (eateryModel.city != null &&
              eateryModel.city!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "City".text.bold.make(),
                      eateryModel.city!.text.make(),
                    ],
                  ),
                ],
              ),
            ),
            if (eateryModel.adresse != null &&
              eateryModel.adresse!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Adresse".text.bold.make(),
                      eateryModel.adresse!.text.make(),
                    ],
                  ),
                ],
              ),
            ),
            if (eateryModel.posLat != null && eateryModel.posLng != null)
            Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width - 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: GlobalTheme.kOrangeColor,
                                      width: 1)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: MediaQuery(
                                    data: MediaQuery.of(context).copyWith(
                                        size: Size(
                                            MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                38,
                                            148)),
                                    child: GoogleMap(
                                        liteModeEnabled: true,
                                        zoomControlsEnabled: false,
                                        zoomGesturesEnabled: false,
                                        onMapCreated: _onMapCreated,
                                        markers: [
                                          Marker(
                                            markerId: MarkerId("main_marker"),
                                            position: LatLng(eateryModel.posLat!, eateryModel.posLng!),
                                            infoWindow: InfoWindow(title: "My Location"),
                                          )
                                        ].toSet(),
                                        initialCameraPosition: CameraPosition(
                                          target: LatLng(eateryModel.posLat!, eateryModel.posLng!),
                                          zoom: 13.0,
                                        ),
                                        onTap: (_) {
                                          openMap(eateryModel.posLat!, eateryModel.posLng!);
                                        },
                                      ),
                                    ),
                              ),
                            ))
        ],
      ),
    );
  }
}
