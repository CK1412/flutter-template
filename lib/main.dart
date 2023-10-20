import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_template/app.dart';
import 'package:flutter_web_template/data/session/session_manager.dart';
import 'package:flutter_web_template/shared/logger/logger.dart';

void main() async {
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SessionManager.init();

    runApp(const App());
  }

  runZonedGuarded(() {
    startApp();
  }, (error, stack) {
    logger.e('ERROR APP', error: error, stackTrace: stack);
  });
}
