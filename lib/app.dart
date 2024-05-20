import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/bloc/app/app_bloc.dart';
import 'app/bloc/auth/auth_bloc.dart';
import 'app/bloc/common/common_bloc.dart';
import 'app/navigation/app_navigator.dart';
import 'app/navigation/app_route_config.dart';
import 'app/navigation/app_route_name.dart';
import 'app/resources/resources.dart';
import 'injection/injector.dart';
import 'l10n/generated/l10n.dart';
import 'presentation/widgets/base/base_common_listener.dart';
import 'presentation/widgets/base/scrolling/clamping_scroll_behavior.dart';
import 'shared/observers/app_navigator_observer.dart';

// This widget is the root of your application.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final CommonBloc _commonBloc = getIt<CommonBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _commonBloc,
        ),
        BlocProvider(
          create: (context) => getIt<AppBloc>()..commonBloc = _commonBloc,
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..commonBloc = _commonBloc,
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) {
        final bool localeChanged = previous.locale != current.locale;
        final bool themeModeChanged = previous.themeMode != current.themeMode;

        return localeChanged || themeModeChanged;
      },
      builder: (context, state) {
        final Locale locale = state.locale;
        final ThemeMode themeMode = state.themeMode;

        return MaterialApp(
          title: 'Flutter template',
          theme: AppThemes.lightTheme(),
          darkTheme: AppThemes.darkTheme(),
          themeMode: themeMode,
          localizationsDelegates: const [
            L.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L.delegate.supportedLocales,
          locale: locale,
          scrollBehavior: const ClampingScrollBehavior(),
          navigatorKey: AppNavigator.rootNavigatorKey,
          onGenerateRoute: AppRouteConfig().onGenerateRoute,
          initialRoute: AppRouteName.splash,
          onUnknownRoute: AppRouteConfig().onUnknownRoute,
          navigatorObservers: [
            routeObserver,
            AppNavigatorObserver(),
          ],
          builder: (context, child) {
            return BaseCommonListener(
              builder: (ctx) => child!,
            );
          },
        );
      },
    );
  }
}
