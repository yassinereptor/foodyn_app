import 'package:badges/badges.dart';
import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_eatery/core/bloc/config_bloc/config_bloc.dart';
import 'package:foodyn_eatery/core/bloc/managment_bloc/management_bloc.dart';
import 'package:foodyn_eatery/core/config/injectable/injection.dart';
import 'package:foodyn_eatery/core/config/router/router.dart';
import 'package:foodyn_eatery/core/data/models/eatery_model.dart';
import 'package:foodyn_eatery/core/domain/entities/app_failure.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/resend_email_widget.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/pages/profile_page.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/views/analysis_view.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/views/management_view.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/views/orders_view.dart';
import 'package:foodyn_eatery/features/dashboard/presentation/widgets/side_menu_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../../data/models/menu_item_model.dart';
import '../views/overview_view.dart';
import '../views/overview_view.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import 'package:velocity_x/velocity_x.dart';

import 'eatery_page.dart';
import 'settings_page.dart';
import 'show_all_eateries_page.dart';
import 'version_page.dart';

class DashboardPage extends StatefulWidget {
  static const kRouteName = "/dashboard";

  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  double _menuSize = 80;
  bool _menuItemsFade = false;
  bool _menuTextItemsFade = false;
  bool _bigMenuItemsFade = false;
  bool _endBigItems = true;
  bool _endItems = true;
  bool _endItemsText = false;
  int _menuItemBodyIndex = 1;
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  late ConfigBloc _configBloc;
  late ManagementBloc _managementBloc;
  List<EateryModel> eateryModelList = [];

  @override
  void initState() {
    super.initState();
    _configBloc = context.read<ConfigBloc>();
    _managementBloc = context.read<ManagementBloc>();
    if (_managementBloc.state.eateries != null)
      eateryModelList = _managementBloc.state.eateries!;
    // _onMenuItemTap(1, init: true);
    // _tabsModel = [
    //   new TabsModel(title: "Overview", icon: Icons.pie_chart, subtitles: [
    //     new TabsModel(
    //         title: "Overview", body: OverviewView(), icon: Icons.pie_chart)
    //   ]),
    //   new TabsModel(title: "Orders", icon: Icons.attach_money, subtitles: [
    //     new TabsModel(
    //         title: "Orders", body: OrdersView(), icon: Icons.attach_money),
    //   ]),
    //   new TabsModel(title: "Management", icon: Icons.apps, subtitles: [
    //     new TabsModel(
    //         title: "Eatery",
    //         body: EateryView(),
    //         icon: Icons.restaurant),
    //     new TabsModel(title: "Menu", body: MenuView(), icon: Icons.menu_book),
    //     new TabsModel(
    //         title: "Membership",
    //         body: MembershipView(),
    //         icon: Icons.card_membership)
    //   ]),
    //   new TabsModel(title: "Settings", icon: Icons.settings, subtitles: [
    //     new TabsModel(
    //         title: "Parameter", body: ParameterView(), icon: Icons.settings),
    //     new TabsModel(title: "QR", body: QRView(), icon: Icons.qr_code),
    //     new TabsModel(
    //         title: "Whatsapp", body: WhatsappView(), icon: Icons.call),
    //     new TabsModel(
    //         title: "Transactions",
    //         body: TransactionsView(),
    //         icon: Icons.transfer_within_a_station),
    //     new TabsModel(
    //         title: "Account", body: AccountView(), icon: Icons.person),
    //     new TabsModel(title: "Logout", body: LogoutView(), icon: Icons.logout)
    //   ]),
    // ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _openMenuSmall() {
    setState(() {
      _menuSize = 80;
      _menuTextItemsFade = true;
      Future.delayed(new Duration(milliseconds: 1000), () {
        setState(() {
          _endItems = true;
          _menuItemsFade = false;
        });
      });
    });
  }

  void _openMenuBig() {
    setState(() {
      _menuSize = MediaQuery.of(context).size.width;
      _bigMenuItemsFade = true;
      Future.delayed(new Duration(milliseconds: 1000), () {
        setState(() {
          _endItemsText = true;
          _menuTextItemsFade = false;
        });
      });
    });
  }

  void _closeMenuSmall() {
    setState(() {
      _menuItemsFade = true;
      Future.delayed(new Duration(milliseconds: 300), () {
        setState(() {
          _menuSize = 0;
        });
      });
      _menuTextItemsFade = true;
    });
  }

  void _closeMenuBig() {
    setState(() {
      _menuSize = 80;
      Future.delayed(new Duration(milliseconds: 1000), () {
        setState(() {
          _endBigItems = true;
          _bigMenuItemsFade = false;
        });
      });
      _menuTextItemsFade = true;
    });
  }

  void _onHorizontalSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.left) {
      if (_menuSize == MediaQuery.of(context).size.width) {
        _closeMenuBig();
      }
    } else {
      if (_menuSize == 80) {
        _openMenuBig();
      }
      if (_menuSize == 0) {
        _openMenuSmall();
      }
    }
  }

  void _onMenuIconTap() {
    if (_menuSize == MediaQuery.of(context).size.width) {
      _closeMenuBig();
    } else {
      _closeMenuSmall();
    }
  }

  void _onMenuItemTap(int index, {bool init = false}) {
    print(index);
    if (index == 0) {
      Routes.seafarer.navigate(ProfilePage.kRouteName);
      print("Profile");
    } else if (index == 1) {
      setState(() {
        _menuItemBodyIndex = 1;
      });
      print("Overview");
    } else if (index == 2) {
      setState(() {
        _menuItemBodyIndex = 2;
      });
      print("Analysis");
    } else if (index == 3) {
      setState(() {
        _menuItemBodyIndex = 3;
      });
      print("Orders");
    } else if (index == 4) {
      setState(() {
        _menuItemBodyIndex = 4;
      });
      print("Management");
    } else if (index == 5) {
      Routes.seafarer.navigate(SettingsPage.kRouteName);
      print("Settings");
    } else if (index == 6) {
      Routes.seafarer.navigate(VersionPage.kRouteName);
      print("Version");
    }
    if (!init && _menuSize == MediaQuery.of(context).size.width) {
      _closeMenuBig();
    }
  }

  void _onEndItems() {
    setState(() {
      if (_menuSize == 0) _endItems = false;
    });
  }

  void _onEndItemsText() {
    setState(() {
      if (_menuSize == 80) _endItemsText = false;
    });
  }

  void _onEndBigItems() {
    setState(() {
      if (_menuSize == MediaQuery.of(context).size.width) _endBigItems = false;
    });
  }

  Future<bool> _onWillPop() {
    if (_menuSize == MediaQuery.of(context).size.width) {
      _closeMenuBig();
      return Future.value(false);
    }
    return Future.value(true);
  }

  void _onRefresh() async {
    _managementBloc.add(ManagementEvent.started());
  }

  void _onLoading() async {
    _managementBloc.add(ManagementEvent.started());
  }

  void _onStateLoadingInProgress() {}

  void _onStateLoadingSuccess() {
    setState(() {
      if (_managementBloc.state.eateries != null)
        eateryModelList = _managementBloc.state.eateries!;
    });
    if (_refreshController.isRefresh) _refreshController.refreshCompleted();
    if (_refreshController.isLoading) _refreshController.loadComplete();
  }

  void _onStateLoadingFailure(AppFailure failure) {
    if (_refreshController.isRefresh) _refreshController.refreshFailed();
    if (_refreshController.isLoading) _refreshController.loadFailed();
  }

  void requestRefresh() {
    _refreshController.requestRefresh();
  }

  void _showAllEateriesTap() {
    Routes.seafarer.navigate(ShowAllEateriesPage.kRouteName);
  }

  void _onEateryTap(int id) async {
    var result = await Routes.seafarer.navigate(EateryPage.kRouteName, params: {
      "eateryModel": eateryModelList.singleWhere((element) => element.id == id)
    });
    if (result != null) requestRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManagementBloc, ManagementState>(
      listener: (context, state) {
        state.type.maybeWhen(
            loadingInProgress: _onStateLoadingInProgress,
            loadingSuccess: _onStateLoadingSuccess,
            loadingFailed: _onStateLoadingFailure,
            orElse: () {});
      },
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: ModalContainerWidget(
            child: SafeArea(
              child: SimpleGestureDetector(
                onHorizontalSwipe: _onHorizontalSwipe,
                swipeConfig: SimpleSwipeConfig(
                  verticalThreshold: 40.0,
                  horizontalThreshold: 40.0,
                  swipeDetectionBehavior:
                      SwipeDetectionBehavior.singularOnEnd,
                ),
                child: Container(
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: new Duration(seconds: 1),
                            curve: Curves.easeInOutCubic,
                            width: _menuSize
                          ),
                          Expanded(
                            child: Container(
                                color: Colors.transparent,
                                height: MediaQuery.of(context).size.height,
                                child: AnimatedOpacity(
                                  onEnd: _onEndBigItems,
                                  duration: Duration(milliseconds: 200),
                                  opacity: _bigMenuItemsFade ? 0.0 : 1.0,
                                  child: _endBigItems
                                      ? NestedScrollView(
                                          headerSliverBuilder: (c, b) => [
                                            SliverAppBar(
                                              backgroundColor: isDark(context)
                              ? GlobalTheme.kPrimaryColor
                              : GlobalTheme.kAccentColor,
                                              pinned: false,
                                              snap: true,
                                              floating: true,
                                              automaticallyImplyLeading: false,
                                              flexibleSpace: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: FocusTraversalGroup(
                                                  policy:
                                                      OrderedTraversalPolicy(),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        AnimatedOpacity(
                                                          duration: new Duration(
                                                              milliseconds: 500),
                                                          opacity:
                                                              (_menuSize == 0)
                                                                  ? 1
                                                                  : 0,
                                                          child: InkWell(
                                                            onTap: _openMenuSmall,
                                                            child: Icon(
                                                              Icons.menu_rounded,
                                                              color: isDark(
                                                                      context)
                                                                  ? GlobalTheme
                                                                      .kAccentColor
                                                                  : GlobalTheme
                                                                      .kPrimaryColor,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        InkWell(
                                                          child: Badge(
                                                            elevation: 0,
                                                            badgeColor:
                                                                GlobalTheme
                                                                    .kRedColor,
                                                            padding:
                                                                EdgeInsets.all(7),
                                                            badgeContent: ("1"
                                                                            .length >
                                                                        1
                                                                    ? "9+"
                                                                    : "1")
                                                                .text
                                                                .size(2)
                                                                .color(GlobalTheme
                                                                    .kAccentColor)
                                                                .make(),
                                                            child: Icon(
                                                              Icons.notifications,
                                                              color: isDark(
                                                                      context)
                                                                  ? GlobalTheme
                                                                      .kAccentColor
                                                                  : GlobalTheme
                                                                      .kPrimaryColor,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                          body: Container(
                                            child: SmartRefresher(
                                              onLoading: _onLoading,
                                              onRefresh: _onRefresh,
                                              header: CustomHeader(
                                                builder: (context, status) {
                                                  if (status ==
                                                      RefreshStatus.completed)
                                                    return SizedBox(
                                                      height: 60,
                                                      width: 60,
                                                      child: FlareActor(
                                                          'assets/animations/loading_success.flr',
                                                          alignment:
                                                              Alignment.center,
                                                          fit: BoxFit.contain,
                                                          animation: "start"),
                                                    );
                                                  else if (status ==
                                                      RefreshStatus.failed)
                                                    return SizedBox(
                                                      height: 60,
                                                      width: 60,
                                                      child: FlareActor(
                                                          'assets/animations/loading_failure.flr',
                                                          alignment:
                                                              Alignment.center,
                                                          fit: BoxFit.contain,
                                                          animation: "start"),
                                                    );
                                                  else if (isDark(context))
                                                    return SizedBox(
                                                      height: 60,
                                                      width: 60,
                                                      child: FlareActor(
                                                          'assets/animations/loading_dark.flr',
                                                          alignment:
                                                              Alignment.center,
                                                          fit: BoxFit.contain,
                                                          animation: "start"),
                                                    );
                                                  else
                                                    return SizedBox(
                                                      height: 60,
                                                      width: 60,
                                                      child: FlareActor(
                                                          'assets/animations/loading_light.flr',
                                                          alignment:
                                                              Alignment.center,
                                                          fit: BoxFit.contain,
                                                          animation: "start"),
                                                    );
                                                },
                                              ),
                                              controller: _refreshController,
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20, right: 20),
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        ResendEmailWidget(),
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                10),
                                                                    gradient:
                                                                        LinearGradient(
                                                                            colors: [
                                                                          Color(
                                                                              0xFFFF414D),
                                                                          Color(
                                                                              0xFFF56A79),
                                                                        ])),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .notifications_on_rounded,
                                                                      color: GlobalTheme
                                                                          .kAccentColor,
                                                                      size: 30,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    "News"
                                                                        .text
                                                                        .xl
                                                                        .color(GlobalTheme
                                                                            .kAccentColor)
                                                                        .make(),
                                                                    Spacer(),
                                                                    InkWell(
                                                                      child: Icon(
                                                                        Icons
                                                                            .close_rounded,
                                                                        color: GlobalTheme
                                                                            .kAccentColor,
                                                                        size: 30,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Voluptatibus est dolores tempora impedit corrupti odio"
                                                                    .text
                                                                    .color(GlobalTheme
                                                                        .kAccentColor)
                                                                    .make()
                                                              ],
                                                            )),
                                                        if (_menuItemBodyIndex ==
                                                            1)
                                                          OverviewView(
                                                            eateryModelList:
                                                                eateryModelList,
                                                            requestRefresh:
                                                                requestRefresh,
                                                            showAllEateriesTap:
                                                                _showAllEateriesTap,
                                                            onEateryTap:
                                                                _onEateryTap,
                                                          ),
                                                        if (_menuItemBodyIndex ==
                                                            2)
                                                          AnalysisView(),
                                                        if (_menuItemBodyIndex ==
                                                            3)
                                                          OrdersView(),
                                                        if (_menuItemBodyIndex ==
                                                            4)
                                                          ManagementView(),
                                                        SizedBox(height: 40)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                )),
                          ),
                        ],
                      ),
                      SideMenuWidget(
                        statusHeight: MediaQuery.of(context).padding.top,
                        menuSize: _menuSize,
                        menuItemsFade: _menuItemsFade,
                        menuTextItemsFade: _menuTextItemsFade,
                        endItems: _endItems,
                        endItemsText: _endItemsText,
                        onMenuIconTap: _onMenuIconTap,
                        onEndItems: _onEndItems,
                        onEndItemsText: _onEndItemsText,
                        onMenuItemTap: _onMenuItemTap,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
