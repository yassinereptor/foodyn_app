import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/side_menu_widget.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../../data/models/menu_item_model.dart';
import '../views/account_view.dart';
import '../views/logout_view.dart';
import '../views/parameter_view.dart';
import '../views/transactions_view.dart';
import '../views/whatsapp_view.dart';
import '../views/membership_view.dart';
import '../views/menu_view.dart';
import '../views/orders_view.dart';
import '../views/overview_view.dart';
import '../views/qr_view.dart';
import '../views/restaurants_view.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import 'package:velocity_x/velocity_x.dart';

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
  List<MenuItemModel> _menuItemModelList = [];

  @override
  void initState() {
    super.initState();

    _menuItemModelList = [
      new MenuItemModel(title: "Overview", icon: Icons.pie_chart),
      new MenuItemModel(title: "Orders", icon: Icons.attach_money),
      new MenuItemModel(title: "Managment", icon: Icons.apps)
    ];

    // _tabsModel = [
    //   new TabsModel(title: "Overview", icon: Icons.pie_chart, subtitles: [
    //     new TabsModel(
    //         title: "Overview", body: OverviewView(), icon: Icons.pie_chart)
    //   ]),
    //   new TabsModel(title: "Orders", icon: Icons.attach_money, subtitles: [
    //     new TabsModel(
    //         title: "Orders", body: OrdersView(), icon: Icons.attach_money),
    //   ]),
    //   new TabsModel(title: "Managment", icon: Icons.apps, subtitles: [
    //     new TabsModel(
    //         title: "Restaurant",
    //         body: RestaurantView(),
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

  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        if (_menuSize == MediaQuery.of(context).size.width) {
          _menuSize = 80;
          Future.delayed(new Duration(milliseconds: 1000), () {
            setState(() {
              _endBigItems = true;
              _bigMenuItemsFade = false;
            });
          });
          _menuTextItemsFade = true;
        }
      } else {
        if (_menuSize == 80) {
          _menuSize = MediaQuery.of(context).size.width;
          _bigMenuItemsFade = true;
          Future.delayed(new Duration(milliseconds: 1000), () {
            setState(() {
              _endItemsText = true;
              _menuTextItemsFade = false;
            });
          });
        }
        if (_menuSize == 0) {
          _menuSize = 80;
          _menuTextItemsFade = true;
          Future.delayed(new Duration(milliseconds: 1000), () {
            setState(() {
              _endItems = true;
              _menuItemsFade = false;
            });
          });
        }
      }
    });
  }

  void _onMenuIconTap() {
    setState(() {
      if (_menuSize == MediaQuery.of(context).size.width) {
        _menuSize = 80;
        _bigMenuItemsFade = false;
      } else if (_menuSize == 80) {
        _menuItemsFade = true;
        Future.delayed(new Duration(milliseconds: 300), () {
          setState(() {
            _menuSize = 0;
          });
        });
      }
    });
    _menuTextItemsFade = true;
  }

  void _onMenuItemTap(int index) {}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SimpleGestureDetector(
          onHorizontalSwipe: _onHorizontalSwipe,
          swipeConfig: SimpleSwipeConfig(
            verticalThreshold: 40.0,
            horizontalThreshold: 40.0,
            swipeDetectionBehavior: SwipeDetectionBehavior.singularOnEnd,
          ),
          child: Container(
            child: Row(
              children: [
                SideMenuWidget(
                  menuSize: _menuSize,
                  menuItemsFade: _menuItemsFade,
                  menuTextItemsFade: _menuTextItemsFade,
                  endItems: _endItems,
                  endItemsText: _endItemsText,
                  onMenuIconTap: _onMenuIconTap,
                  onEndItems: _onEndItems,
                  onEndItemsText: _onEndItemsText,
                  onMenuItemTap: _onMenuItemTap,
                  menuItemModelList: _menuItemModelList,
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
                            ? Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          AnimatedOpacity(
                                            duration:
                                                new Duration(milliseconds: 500),
                                            opacity: (_menuSize == 0) ? 1 : 0,
                                            child: InkWell(
                                              child: Icon(
                                                Icons.menu_rounded,
                                                color: isDark(context)
                                                    ? GlobalTheme.kAccentColor
                                                    : GlobalTheme.kPrimaryColor,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            child: Icon(
                                              Icons.notifications,
                                              color: isDark(context)
                                                  ? GlobalTheme.kAccentColor
                                                  : GlobalTheme.kPrimaryColor,
                                              size: 30,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
