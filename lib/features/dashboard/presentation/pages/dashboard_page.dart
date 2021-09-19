import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodyn_rest/features/dashboard/data/models/tabs_model.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/account_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/logout_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/parameter_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/transactions_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/whatsapp_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/management_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/membership_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/menu_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/orders_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/overview_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/qr_view.dart';
import 'package:foodyn_rest/features/dashboard/presentation/views/restaurants_view.dart';
import 'package:foodyn_rest/features/auth/presentation/pages/register_page.dart';
import '../../../auth/presentation/pages/login_page.dart';
import 'package:foodyn_rest/features/intro/presentation/pages/intro_page.dart';
import 'package:seafarer/seafarer.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/l10n/l10n.dart';
import 'package:foodyn_rest/core/utils/global_utils.dart';
import 'package:foodyn_rest/core/utils/lang.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class DashboardPage extends StatefulWidget {
  static const kRouteName = "/dashboard";

  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _iconController;
  late List<TabsModel> _tabsModel;
  GlobalKey<SliderMenuContainerState> _keyMenu =
      new GlobalKey<SliderMenuContainerState>();
  bool _isMenuClicked = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _iconController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    _tabsModel = [
      new TabsModel(title: "Overview", icon: Icons.pie_chart, subtitles: [
        new TabsModel(
            title: "Overview", body: OverviewView(), icon: Icons.pie_chart)
      ]),
      new TabsModel(title: "Orders", icon: Icons.attach_money, subtitles: [
        new TabsModel(
            title: "Orders", body: OrdersView(), icon: Icons.attach_money),
      ]),
      new TabsModel(title: "Managment", icon: Icons.apps, subtitles: [
        new TabsModel(
            title: "Restaurant",
            body: RestaurantView(),
            icon: Icons.restaurant),
        new TabsModel(title: "Menu", body: MenuView(), icon: Icons.menu_book),
        new TabsModel(
            title: "Membership",
            body: MembershipView(),
            icon: Icons.card_membership)
      ]),
      new TabsModel(title: "Settings", icon: Icons.settings, subtitles: [
        new TabsModel(
            title: "Parameter", body: ParameterView(), icon: Icons.settings),
        new TabsModel(title: "QR", body: QRView(), icon: Icons.qr_code),
        new TabsModel(
            title: "Whatsapp", body: WhatsappView(), icon: Icons.call),
        new TabsModel(
            title: "Transactions",
            body: TransactionsView(),
            icon: Icons.transfer_within_a_station),
        new TabsModel(
            title: "Account", body: AccountView(), icon: Icons.person),
        new TabsModel(title: "Logout", body: LogoutView(), icon: Icons.logout)
      ]),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SliderMenuContainer(
          sliderMenuOpenSize: MediaQuery.of(context).size.width - 60,
          key: _keyMenu,
          hasAppBar: false,
          sliderMenu: Container(),
          sliderMain: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: isDark(context)
                    ? GlobalTheme.kPrimaryLightColor
                    : GlobalTheme.kAccentDarkColor,
                pinned: false,
                snap: true,
                floating: true,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: FocusTraversalGroup(
                    policy: OrderedTraversalPolicy(),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.menu_close,
                              progress: _iconController
                            ,),
                            onPressed: () { 
                              _keyMenu.currentState!.toggle();
                              setState(() {
                                _isMenuClicked = !_isMenuClicked;
                                _isMenuClicked ? _iconController.forward() : _iconController.reverse();
                              });
                            },
                          ),
                          Image.asset(
                            "assets/logos/foodyn_vertical_dark_logo.png",
                            height: 30,
                          ),
                          IconButton(
                            icon: Icon(Icons.notifications),
                            onPressed: () { 
                             
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: _buildTabViews(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabViews() {
    return [
      ..._tabsModel
          .mapIndexed((e, index) => e.subtitles![e.selected_subtitle].body!)
    ];
  }
}
