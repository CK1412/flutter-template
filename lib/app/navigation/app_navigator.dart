import 'package:flutter_web_template/app/dependencies.dart';
import 'package:flutter_web_template/app/navigation/app_router.dart';
import 'package:go_router/go_router.dart';

/// There are three ways to pass params: pathParameters, queryParameters, extra
///
/// How to use: https://stackoverflow.com/a/74813803
///
class AppNavigator {
  AppNavigator._();

  static GoRouter get _router => getIt<AppRouter>().router;

  static void pushNamed(
    String name, {
    Object? extra,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    _router.pushNamed(
      name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    _router.goNamed(
      name,
      queryParameters: queryParameters,
      pathParameters: pathParameters,
      extra: extra,
    );
  }
}
