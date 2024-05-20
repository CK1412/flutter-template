import 'package:flutter/material.dart';

import '../logger/logger.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    String logMessage = 'Navigator Observer -- didPush\n';
    if (previousRoute != null) {
      logMessage += 'Previous route: ${previousRoute.str}\n';
    }
    logMessage += 'Route: ${route.str}';
    logger.d(logMessage);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    String logMessage = 'Navigator Observer -- didPop\n';
    if (previousRoute != null) {
      logMessage += 'Previous route: ${previousRoute.str}\n';
    }
    logMessage += 'Route: ${route.str}';
    logger.d(logMessage);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    String logMessage = 'Navigator Observer -- didRemove\n';
    if (previousRoute != null) {
      logMessage += 'Previous route: ${previousRoute.str}\n';
    }
    logMessage += 'Route: ${route.str}';
    logger.d(logMessage);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    String logMessage = 'Navigator Observer -- didReplace\n';
    if (oldRoute != null) {
      logMessage += 'Old route: ${oldRoute.str}\n';
    }
    if (newRoute != null) {
      logMessage += 'New route: ${newRoute.str}\n';
    }
    logger.d(logMessage);
  }
}

extension on Route<dynamic> {
  String get str => '(${settings.name}, ${settings.arguments})';
}

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
