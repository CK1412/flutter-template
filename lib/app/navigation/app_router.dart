import 'package:flutter/material.dart';
import 'package:flutter_web_template/app/navigation/app_routes.dart';
import 'package:flutter_web_template/presentation/common_widgets/error_page.dart';
import 'package:flutter_web_template/presentation/pages/details/details_page.dart';
import 'package:flutter_web_template/presentation/pages/home/home_page.dart';
import 'package:flutter_web_template/presentation/pages/login/login_page.dart';
import 'package:flutter_web_template/shared/observers/app_navigator_observer.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  GlobalKey get rootNavigatorKey => _rootNavigatorKey;

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: [
      AppNavigatorObserver(),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
    // redirect: (context, state) {
    //   final isLoggedIn = context.read<AppBloc>().state.isLoggedIn;
    //
    //   if (!isLoggedIn) {
    //     return AppRoutes.root.path;
    //   } else {
    //     return AppRoutes.login.path;
    //   }
    // },
    routes: [
      GoRoute(
        name: AppRoutes.root.name,
        path: AppRoutes.root.path,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: AppRoutes.details.name,
            path: AppRoutes.details.path,
            pageBuilder: (context, state) {
              String? id = state.uri.queryParameters['id'];
              return NoTransitionPage(
                child: DetailsPage(id: id ?? ''),
                name: state.name,
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.login.name,
        path: AppRoutes.login.path,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: LoginPage());
        },
      ),
    ],
  );

  GoRouter get router => _router;
}
