import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/dependencies.dart';
import 'package:flutter_web_template/app/navigation/app_router.dart';
import 'package:flutter_web_template/app/navigation/app_routes.dart';
import 'package:flutter_web_template/shared/utils/uri_utils.dart';
import 'package:go_router/go_router.dart';

/// There are three ways to pass params: pathParameters, queryParameters, extra.
/// How to use: https://stackoverflow.com/a/74813803.
///
/// # Explain the arguments
///
/// The use of the [extra] object is not recommended for use in targeting Flutter web apps.
///
/// [withCurrentPathParams],
/// * When uses for navigating new route and current path have pathParameters (e.g. path: '/home/:tab'),
///  must set withCurrentPathParams = true.
/// * Otherwise, when navigating the same route,  set withCurrentPathParams = false.
///
class AppNavigator {
  AppNavigator._();

  static GoRouter get _router => getIt<AppRouter>().router;

  static BuildContext get context =>
      getIt<AppRouter>().rootNavigatorKey.currentContext!;

  static get currentPath =>
      GoRouter.of(context).routeInformationProvider.value.location;

  static void pushRoute(
    AppRoute route, {
    Object? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    bool routerNeglect = false,
    bool withCurrentPathParams = false,
  }) {
    _handleNavigation(
      context,
      routerNeglect: routerNeglect,
      callback: () {
        if (withCurrentPathParams) {
          final uri = UriUtils.createUri(
            path: '$currentPath/${route.path}',
            pathParameters: pathParameters,
            queryParameters: queryParameters,
          );

          _router.push(
            uri.toString(),
            extra: extra,
          );
        } else {
          _router.pushNamed(
            route.name,
            extra: extra,
            pathParameters: pathParameters,
            queryParameters: queryParameters,
          );
        }
      },
    );
  }

  static void goRoute(
    AppRoute route, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
    bool routerNeglect = false,
    bool withCurrentPathParams = false,
  }) {
    _handleNavigation(
      context,
      routerNeglect: routerNeglect,
      callback: () {
        if (withCurrentPathParams) {
          final uri = UriUtils.createUri(
            path: '$currentPath/${route.path}',
            pathParameters: pathParameters,
            queryParameters: queryParameters,
          );

          _router.go(
            uri.toString(),
            extra: extra,
          );
        } else {
          _router.goNamed(
            route.name,
            queryParameters: queryParameters,
            pathParameters: pathParameters,
            extra: extra,
          );
        }
      },
    );
  }

  static void pop<T extends Object?>([T? result]) {
    _router.pop<T>(result);
  }
}

/// [routerNeglect] = true, turn off history tracking in the browser for this navigation.
void _handleNavigation(
  BuildContext context, {
  bool routerNeglect = false,
  required VoidCallback callback,
}) {
  if (routerNeglect) {
    Router.neglect(context, () {
      callback.call();
    });
  } else {
    callback.call();
  }
}
