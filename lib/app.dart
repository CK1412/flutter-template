import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/bloc/app_bloc.dart';
import 'app/bloc/auth/auth_bloc.dart';
import 'app/navigation/app_router.dart';
import 'injection/injector.dart';
import 'l10n/generated/l10n.dart';
import 'presentation/common_widgets/base/base_page.dart';
import 'presentation/common_widgets/scrolling/clamping_scroll_behavior.dart';
import 'shared/resources/resources.dart';

// This widget is the root of your application.
class App extends StatelessWidget {
  const App({super.key});

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
      builder: (context, child) {
        return _ProvidersCreator(child: child);
      },
    );
  }
}

class _ProvidersCreator extends StatefulWidget {
  const _ProvidersCreator({required this.child});

  final Widget? child;

  @override
  State<_ProvidersCreator> createState() => _ProvidersCreatorState();
}

class _ProvidersCreatorState extends BasePageState<_ProvidersCreator, AppBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>()..commonBloc = commonBloc,
      child: widget.child,
    );
  }
}
