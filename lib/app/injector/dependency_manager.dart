import '../../app_flavor_config.dart';
import 'injector.dart';

class DependencyManager {
  static void inject(AppFlavorConfig appFlavorConfig) {
    getIt.registerLazySingleton<AppFlavorConfig>(() => appFlavorConfig);

    configureDependencies();
  }
}
