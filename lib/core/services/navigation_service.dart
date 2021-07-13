import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey =
      new GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  NavigatorState get currentState => _navigatorKey.currentState!;
}

final navigatorService = NavigationService();
final navigatorKey = navigatorService._navigatorKey;
final navigator = navigatorService.currentState;
