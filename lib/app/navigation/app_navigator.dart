import 'package:flutter/material.dart';

/// [AppNavigatorStackAction] is action enum for navigation stack
enum AppNavigatorStackAction {
  // keep all the stacks
  keep,
  // replace the top stack
  replace,
  // remove all stacks
  removeAll,
}

/// [AppNavigator] is a navigation class used to navigate to page screens.
class AppNavigator {
  AppNavigator._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => rootNavigatorKey.currentContext!;

  static NavigatorState? get navigatorState => rootNavigatorKey.currentState;

  static Future<dynamic> go(
    String routeName, {
    Object? arguments,
    AppNavigatorStackAction action = AppNavigatorStackAction.keep,
  }) async {
    switch (action) {
      case AppNavigatorStackAction.removeAll:
        return await navigatorState?.pushNamedAndRemoveUntil(
          routeName,
          (route) => false,
          arguments: arguments,
        );
      case AppNavigatorStackAction.keep:
        return await navigatorState?.pushNamed(
          routeName,
          arguments: arguments,
        );
      case AppNavigatorStackAction.replace:
        return await navigatorState?.pushReplacementNamed(
          routeName,
          arguments: arguments,
        );
    }
  }

  static bool canPop() {
    return navigatorState?.canPop() ?? false;
  }

  static void pop({Object? arguments}) {
    if (canPop()) {
      return navigatorState?.pop(arguments);
    }
  }

  static void popUntil({required String routeName}) {
    if (navigatorState == null) {
      return;
    }

    final bool isCurrent = _isNewRouteSameAsCurrent(routeName, navigatorState!);

    if (!isCurrent) {
      navigatorState?.popUntil((route) => route.settings.name == routeName);
    }
  }

  static bool _isNewRouteSameAsCurrent(
    String routeName,
    NavigatorState currentState,
  ) {
    bool isCurrent = false;

    currentState.popUntil((route) {
      if (route.settings.name == routeName) {
        isCurrent = true;
      }
      return true;
    });

    return isCurrent;
  }

  /// Check if the route is the current route
  static bool isCurrentRoute(String routeName) {
    if (navigatorState == null) {
      return false;
    }

    return _isNewRouteSameAsCurrent(routeName, navigatorState!);
  }
}
