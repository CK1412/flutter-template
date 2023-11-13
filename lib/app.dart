import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/bloc/auth/auth_bloc.dart';
import 'app/injector/injector.dart';
import 'app/navigation/app_router.dart';
import 'l10n/generated/l10n.dart';
import 'presentation/common_widgets/scrolling/clamping_scroll_behavior.dart';
import 'shared/constants/resources/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: const _MaterialApp(),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter template',
      theme: AppThemes.lightTheme(),
      darkTheme: AppThemes.darkTheme(),
      localizationsDelegates: const [
        L.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L.delegate.supportedLocales,
      locale: const Locale('vi', 'VN'),
      routerConfig: getIt<AppRouter>().router,
      scrollBehavior: const ClampingScrollBehavior(),
    );
  }
}
