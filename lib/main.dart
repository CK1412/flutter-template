import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_template/app.dart';
import 'package:flutter_web_template/data/session/session_manager.dart';
import 'package:flutter_web_template/shared/logger/logger.dart';
import 'package:flutter_web_template/shared/observers/app_bloc_observer.dart';

void main() async {
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = AppBlocObserver();
    await SessionManager.init();

    runApp(const App());
  }

  // Run app with catch error
  runZonedGuarded(() {
    startApp();
  }, (error, stack) {
    logger.e('ERROR APP', error: error, stackTrace: stack);
  });
}
