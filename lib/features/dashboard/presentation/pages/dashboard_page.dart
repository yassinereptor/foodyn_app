import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animations/animations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:foodyn_rest/features/dashboard/presentation/widgets/animated_bottom_app_bar_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/bottom_drawer_items_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/bottom_drawer_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/top_tab_bar_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/top_tab_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/waterfall_notched_rectangle_widget.dart';
import 'package:foodyn_rest/features/welcome/presentation/pages/register_page.dart';
import '../../../welcome/presentation/pages/login_page.dart';
import 'package:foodyn_rest/features/intro/presentation/pages/intro_page.dart';
import 'package:seafarer/seafarer.dart';
import 'package:foodyn_rest/core/config/router/router.dart';
import 'package:foodyn_rest/core/config/theme/global_theme.dart';
import 'package:foodyn_rest/core/l10n/l10n.dart';
import 'package:foodyn_rest/core/utils/global_utils.dart';
import 'package:foodyn_rest/core/utils/lang.dart';
import 'package:foodyn_rest/core/utils/theme_brightness.dart';
import 'package:foodyn_rest/features/splash/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

const int turnsToRotateRight = 1;
const int turnsToRotateLeft = 3;


const _iconAssetLocation = 'reply/icons';
final desktopMailNavKey = GlobalKey<NavigatorState>();
final mobileMailNavKey = GlobalKey<NavigatorState>();
const double _kFlingVelocity = 2.0;
const _kAnimationDuration = Duration(milliseconds: 300);

class DashboardPage extends StatefulWidget {
  static const kRouteName = "/dashboard";

  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> 
    with TickerProviderStateMixin, RestorationMixin {
  
  late TabController _tabController;
  RestorableInt tabIndex = RestorableInt(0);

  final _bottomDrawerKey = GlobalKey(debugLabel: 'Bottom Drawer');
  late AnimationController _drawerController;
  late AnimationController _dropArrowController;
  late AnimationController _bottomAppBarController;
  late Animation<double> _drawerCurve;
  late Animation<double> _dropArrowCurve;
  late Animation<double> _bottomAppBarCurve;
  late List<TabsModel> _tabsModel;
  late bool _menuClicked;

  @override
  String get restorationId => 'home_page';
  
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();

    _menuClicked = false;

    _tabController = TabController(length: TopTabWidget.tabCount, vsync: this)
      ..addListener(() {
        // Set state to make sure that the [TopTabWidget] widgets get updated when changing tabs.
        setState(() {
          tabIndex.value = _tabController.index;
        });
      });

    _drawerController = AnimationController(
      duration: _kAnimationDuration,
      value: 0,
      vsync: this,
    )..addListener(() {
        if (_drawerController.value < 0.01) {
          setState(() {
            //Reload state when drawer is at its smallest to toggle visibility
            //If state is reloaded before this drawer closes abruptly instead
            //of animating.
          });
        }
      });

    _dropArrowController = AnimationController(
      duration: _kAnimationDuration,
      vsync: this,
    );

    _bottomAppBarController = AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 250),
    );

    _dropArrowController.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        setState(() {
          _menuClicked = !_menuClicked;
        });
    });

    _drawerCurve = CurvedAnimation(
      parent: _drawerController,
      curve: standardEasing,
      reverseCurve: standardEasing.flipped,
    );

    _dropArrowCurve = CurvedAnimation(
      parent: _dropArrowController,
      curve: standardEasing,
      reverseCurve: standardEasing.flipped,
    );

    _bottomAppBarCurve = CurvedAnimation(
      parent: _bottomAppBarController,
      curve: standardEasing,
      reverseCurve: standardEasing.flipped,
    );

    _tabsModel = [
      new TabsModel(title: "Overview", icon: Icons.pie_chart, subtitles: [
        new TabsModel(title: "Overview", body: OverviewView(), icon: Icons.pie_chart)
      ]),
      new TabsModel(title: "Orders", icon: Icons.attach_money, subtitles: [
        new TabsModel(title: "Orders", body: OrdersView(), icon: Icons.attach_money),
      ]),
      new TabsModel(title: "Managment", icon: Icons.apps, subtitles: [
        new TabsModel(title: "Restaurant", body: RestaurantView(), icon: Icons.restaurant),
        new TabsModel(title: "Menu", body: MenuView(), icon: Icons.menu_book),
        new TabsModel(title: "Membership", body: MembershipView(), icon: Icons.card_membership)
      ]),
      new TabsModel(title: "Settings", icon: Icons.settings, subtitles: [
        new TabsModel(title: "Parameter", body: ParameterView(), icon: Icons.settings),
        new TabsModel(title: "QR", body: QRView(), icon: Icons.qr_code),
        new TabsModel(title: "Whatsapp", body: WhatsappView(), icon: Icons.call),
        new TabsModel(title: "Transactions", body: TransactionsView(), icon: Icons.transfer_within_a_station),
        new TabsModel(title: "Account", body: AccountView(), icon: Icons.person),
        new TabsModel(title: "Logout", body: LogoutView(), icon: Icons.logout)
      ]),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    _drawerController.dispose();
    _dropArrowController.dispose();
    _bottomAppBarController.dispose();
    super.dispose();
  }


  bool get _bottomDrawerVisible {
    final status = _drawerController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBottomDrawerVisibility() {
    // if (_drawerController.value < 0.4) {
    //   _drawerController.animateTo(0.4, curve: standardEasing);
    //   _dropArrowController.animateTo(0.35, curve: standardEasing);
    //   return;
    // }

    // _dropArrowController.forward();
    // _drawerController.fling(
    //   velocity: _bottomDrawerVisible ? -_kFlingVelocity : _kFlingVelocity,
    // );
    showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                              ),
                              builder: (BuildContext context) {
                                return Container();
                              });
  }

  double get _bottomDrawerHeight {
    final renderBox =
        _bottomDrawerKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  void _handleDragUpdate(DragUpdateDetails? details) {
    _drawerController.value -= details!.primaryDelta! / _bottomDrawerHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_drawerController.isAnimating ||
        _drawerController.status == AnimationStatus.completed) {
      return;
    }

    final flingVelocity =
        details.velocity.pixelsPerSecond.dy / _bottomDrawerHeight;

    if (flingVelocity < 0.0) {
      _drawerController.fling(
        velocity: math.max(_kFlingVelocity, -flingVelocity),
      );
    } else if (flingVelocity > 0.0) {
      _dropArrowController.forward();
      _drawerController.fling(
        velocity: math.min(-_kFlingVelocity, -flingVelocity),
      );
    } else {
      if (_drawerController.value < 0.6) {
        _dropArrowController.forward();
      }
      _drawerController.fling(
        velocity:
            _drawerController.value < 0.6 ? -_kFlingVelocity : _kFlingVelocity,
      );
    }
  }

  void _onDestinationSelected(int index) {
    setState(() {
      _tabsModel[_tabController.index].selected_subtitle = index;
    });
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final drawerSize = constraints.biggest;
    final drawerTop = drawerSize.height;

    final drawerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, drawerTop, 0.0, 0.0),
      end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_drawerCurve);

    return Stack(
      clipBehavior: Clip.none,
      key: _bottomDrawerKey,
      children: [
        Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _buildTabViews(),
            ),
          ),
        ],
      ),
        GestureDetector(
          onTap: () {
            _drawerController.reverse();
            _dropArrowController.reverse();
          },
          child: Visibility(
            maintainAnimation: true,
            maintainState: true,
            visible: _bottomDrawerVisible,
            child: FadeTransition(
              opacity: _drawerCurve,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).bottomSheetTheme.modalBackgroundColor,
              ),
            ),
          ),
        ),
        PositionedTransition(
          rect: drawerAnimation,
          child: Visibility(
            visible: _bottomDrawerVisible,
            child: BottomDrawerWidget(
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              body: BottomDrawerItemsWidget(
                    items: _tabsModel[_tabController.index].subtitles!,
                    drawerController: _drawerController,
                    dropArrowController: _dropArrowController,
                    onItemTapped: _onDestinationSelected,
                
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
              builder: _buildStack,
            ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight + statusBarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            decoration: BoxDecoration(
              color: isDark(context) ? GlobalTheme.kPrimaryLightColor : GlobalTheme.kAccentDarkColor,
            ),
            child: 
            FocusTraversalGroup(
                    policy: OrderedTraversalPolicy(),
                    child: TopTabBarWidget(
                        tabs: _buildTabs(context: context, theme: theme),
                        tabController: _tabController,
                      ),
                  ),
          ),
        ],)),
      bottomNavigationBar: AnimatedBottomAppBarWidget(
              bottomAppBarController: _bottomAppBarController,
              bottomAppBarCurve: _bottomAppBarCurve,
              bottomDrawerVisible: _bottomDrawerVisible,
              drawerController: _drawerController,
              dropArrowCurve: _dropArrowCurve,
              toggleBottomDrawerVisibility: _toggleBottomDrawerVisibility,
              menuClicked: _menuClicked,
            ),
        floatingActionButton: _bottomDrawerVisible
            ? null
            : Padding(
                padding: EdgeInsetsDirectional.only(bottom: 8),
                child: Container(
                  height: kToolbarHeight,
                  width: kToolbarHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark(context) ? GlobalTheme.kAccentColor : GlobalTheme.kPrimaryColor
                  ),
                  child: Center(
                    child: Icon(Icons.notifications,
                    color: isDark(context) ? GlobalTheme.kPrimaryColor : GlobalTheme.kAccentColor,),
                  )
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> _buildTabs(
      {BuildContext? context, ThemeData? theme}) {
    return [
      ..._tabsModel.mapIndexed((e, index) => TopTabWidget(
        theme: theme!,
        iconData: e.icon,
        title: e.title,
        tabIndex: index,
        tabController: _tabController,
      ),)
    ];
  }

  List<Widget> _buildTabViews() {
    return [
      ..._tabsModel.mapIndexed((e, index) => e.subtitles![e.selected_subtitle].body!)
    ];
  }
}

