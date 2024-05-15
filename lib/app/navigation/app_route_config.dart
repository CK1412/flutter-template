import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import '../../presentation/common_widgets/error_page.dart';
import '../../presentation/example_pages/auth/auth_page.dart';
import '../../presentation/example_pages/details/details_page.dart';
import '../../presentation/example_pages/home/home_page.dart';
import '../../presentation/example_pages/settings/settings_page.dart';
import '../../presentation/pages/splash/splash_page.dart';
import 'app_route_name.dart';

typedef WidgetBuilderWithArgs = Widget Function(
  BuildContext context,
  Object? args,
);

class AppRouteConfig {
  AppRouteConfig._();

  static AppRouteConfig? _instance;

  factory AppRouteConfig() {
    return _instance ??= AppRouteConfig._();
  }

  Map<String, WidgetBuilder> get routes => _config.mapValues(
        (p0) => (BuildContext context) {
          try {
            final args = ModalRoute.of(context)?.settings.arguments;
            return p0.value.call(context, args);
          } catch (e) {
            return const ErrorPage();
          }
        },
      );

  final Map<String, WidgetBuilderWithArgs> _config = {
    AppRouteName.splash: (context, args) {
      return const SplashPage();
    },
    AppRouteName.home: (context, args) {
      return HomePage(tabIndex: (args ?? 0) as int);
    },
    AppRouteName.auth: (context, args) {
      return const AuthPage();
    },
    AppRouteName.details: (context, args) {
      return DetailsPage(id: args! as String);
    },
    AppRouteName.settings: (context, args) {
      return const SettingPage();
    },
  };
}
