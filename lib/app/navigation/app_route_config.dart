import 'package:flutter/material.dart';

import '../../presentation/common_widgets/error_page.dart';
import '../../presentation/example_pages/auth/auth_page.dart';
import '../../presentation/example_pages/details/details_page.dart';
import '../../presentation/example_pages/home/home_page.dart';
import '../../presentation/example_pages/settings/settings_page.dart';
import '../../presentation/pages/splash/splash_page.dart';
import 'app_route_name.dart';

class AppRouteConfig {
  AppRouteConfig._();

  static AppRouteConfig? _instance;

  factory AppRouteConfig() {
    return _instance ??= AppRouteConfig._();
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SplashPage(),
        );
      case AppRouteName.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              HomePage(tabIndex: (settings.arguments ?? 0) as int),
        );
      case AppRouteName.auth:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const AuthPage(),
        );
      case AppRouteName.details:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => DetailsPage(id: settings.arguments! as String),
        );
      case AppRouteName.settings:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SettingPage(),
        );
      default:
        return null;
    }
  }

  Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => const ErrorPage(),
    );
  }
}
