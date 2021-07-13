import '../theme/dark_theme.dart';
import 'light_theme.dart';

enum AppTheme { Light, Dark }

final appThemeData = {
  AppTheme.Light: lightTheme,
  AppTheme.Dark: darkTheme,
};
