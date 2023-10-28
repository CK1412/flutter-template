import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_template/app/bloc/auth/auth_bloc.dart';
import 'package:flutter_web_template/app/navigation/app_routes.dart';
import 'package:flutter_web_template/presentation/common_widgets/error_page.dart';
import 'package:flutter_web_template/presentation/pages/details/details_page.dart';
import 'package:flutter_web_template/presentation/pages/home/home_page.dart';
import 'package:flutter_web_template/presentation/pages/login/login_page.dart';
import 'package:flutter_web_template/presentation/pages/sign_up/sign_up_page.dart';
import 'package:go_router/go_router.dart';

import '../dependencies.dart';

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
        name: AppRoutes.root.name,
        path: AppRoutes.root.path,
        redirect: (context, state) => AppRoutes.home.initPath,
      ),
      GoRoute(
        name: AppRoutes.home.name,
        path: AppRoutes.home.path,
        pageBuilder: (context, state) {
          final tabIndexValue = state.pathParameters['tab'];
          final tabIndex = int.tryParse(tabIndexValue.toString()) ?? 0;
          return NoTransitionPage(
            name: state.name,
            key: state.pageKey,
            child: HomePage(tabIndex: tabIndex),
          );
        },
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
          return NoTransitionPage(
            child: const LoginPage(),
            name: state.name,
          );
        },
      ),
      GoRoute(
        name: AppRoutes.signUp.name,
        path: AppRoutes.signUp.path,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: const SignUpPage(),
            name: state.name,
          );
        },
      ),
    ],
    refreshListenable: _GoRouterRefreshStream(getIt<AuthBloc>().stream),
    redirect: (context, state) {
      final bool isAuthenticated =
          context.read<AuthBloc>().state.isAuthenticated;

      final bool isSigningUp = state.matchedLocation == AppRoutes.signUp.path;
      final bool isLoggingIn = state.matchedLocation == AppRoutes.login.path;

      final bool isAuthenticating = isSigningUp || isLoggingIn;

      if (!isAuthenticated) {
        return isAuthenticating ? null : AppRoutes.login.path;
      }

      if (isAuthenticating) return AppRoutes.root.path;

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
