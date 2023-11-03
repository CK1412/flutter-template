import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app/app.dart';
import 'app/injector/injector.dart';
import 'data/session/session_manager.dart';
import 'shared/logger/logger.dart';
import 'shared/observers/app_bloc_observer.dart';

void main() async {
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    usePathUrlStrategy();
    Bloc.observer = AppBlocObserver();
    configureDependencies();

    await SessionManager.init();

    runApp(const App());
  }

  // Run app with catch error
  await runZonedGuarded(startApp, (error, stack) {
    logger.e('ERROR APP', error: error, stackTrace: stack);
  });
}
