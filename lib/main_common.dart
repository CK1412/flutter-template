import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'app_flavor_config.dart';
import 'data/session/session_manager.dart';
import 'injection/dependency_manager.dart';
import 'shared/exceptions/error_handler.dart';
import 'shared/observers/app_bloc_observer.dart';
import 'shared/useful/network_connectivity.dart';

Future<void> mainCommon(AppFlavorConfig appFlavorConfig) async {
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    usePathUrlStrategy();
    NetworkConnectivity().init();

    Bloc.observer = AppBlocObserver();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
    );

    await DependencyManager.inject(appFlavorConfig);

    await SessionManager.instance.init();

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
