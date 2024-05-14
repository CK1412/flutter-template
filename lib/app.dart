import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/bloc/app_bloc.dart';
import 'app/bloc/auth/auth_bloc.dart';
import 'app/bloc/base/common/common_bloc.dart';
import 'app/navigation/app_router.dart';
import 'injection/injector.dart';
import 'l10n/generated/l10n.dart';
import 'presentation/common_widgets/scrolling/clamping_scroll_behavior.dart';
import 'shared/resources/resources.dart';

// This widget is the root of your application.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppBloc>()..commonBloc = CommonBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..commonBloc = CommonBloc(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

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

        return MaterialApp.router(
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
          routerConfig: AppRouter().router,
          scrollBehavior: const ClampingScrollBehavior(),
        );
      },
    );
  }
}
