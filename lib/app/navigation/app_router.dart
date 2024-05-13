import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../injection/injector.dart';
import '../../presentation/common_widgets/error_page.dart';
import '../../presentation/example_pages/details/details_page.dart';
import '../../presentation/example_pages/home/home_page.dart';
import '../../presentation/example_pages/login/login_page.dart';
import '../../presentation/example_pages/settings/settings_page.dart';
import '../../presentation/example_pages/sign_up/sign_up_page.dart';
import '../bloc/auth/auth_bloc.dart';
import 'app_routes.dart';
import 'route_params.dart';

@LazySingleton()
class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  GlobalKey get rootNavigatorKey => _rootNavigatorKey;

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    // observers: [
    //   AppNavigatorObserver(),
    // ],
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => const ErrorPage(),
    routes: [
      GoRoute(
        name: AppRoute.root.name,
        path: AppRoute.root.path,
        redirect: (context, state) => AppRoute.home.initPath,
      ),
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        pageBuilder: (context, state) {
          final tabIndexValue = state.pathParameters[RouteParamsKey.tab];
          final tabIndex = int.tryParse(tabIndexValue.toString()) ?? 0;
          return NoTransitionPage(
            name: state.name,
            key: state.pageKey,
            child: HomePage(tabIndex: tabIndex),
          );
        },
        routes: [
          GoRoute(
            name: AppRoute.details.name,
            path: AppRoute.details.path,
            pageBuilder: (context, state) {
              final String? id = state.uri.queryParameters[RouteParamsKey.id];
              return NoTransitionPage(
                child: DetailsPage(id: id ?? ''),
                name: state.name,
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: AppRoute.login.name,
        path: AppRoute.login.path,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: const LoginPage(),
            name: state.name,
          );
        },
      ),
      GoRoute(
        name: AppRoute.signUp.name,
        path: AppRoute.signUp.path,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: const SignUpPage(),
            name: state.name,
          );
        },
      ),
      GoRoute(
        name: AppRoute.settings.name,
        path: AppRoute.settings.path,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: const SettingPage(),
            name: state.name,
          );
        },
      ),
    ],
    refreshListenable: _GoRouterRefreshStream(getIt<AuthBloc>().stream),
    redirect: (context, state) {
      final bool isAuthenticated =
          context.read<AuthBloc>().state.isAuthenticated;

      final bool isSigningUp = state.matchedLocation == AppRoute.signUp.path;
      final bool isLoggingIn = state.matchedLocation == AppRoute.login.path;

      final bool isAuthenticating = isSigningUp || isLoggingIn;

      if (!isAuthenticated) {
        return isAuthenticating ? null : AppRoute.login.path;
      }

      if (isAuthenticating) {
        return AppRoute.root.path;
      }

      return null;
    },
  );

  GoRouter get router => _router;
}

final class _GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  _GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
}
