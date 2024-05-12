import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app.dart';
import 'app/session/session_manager.dart';
import 'app_flavor_config.dart';
import 'injection/dependency_manager.dart';
import 'shared/exceptions/error_handler.dart';
import 'shared/observers/app_bloc_observer.dart';
import 'shared/useful/network_connectivity.dart';

Future<void> mainCommon(AppFlavorConfig appFlavorConfig) async {
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    usePathUrlStrategy();
    Bloc.observer = AppBlocObserver();
    DependencyManager.inject(appFlavorConfig);

    await SessionManager.init();
    NetworkConnectivity().init();

    runApp(const App());
  }

  // Run app with catch error
  await runZonedGuarded(
    startApp,
    (error, stack) {
      ErrorHandler().logError('ERROR APP', error: error, stackTrace: stack);
    },
  );
}
