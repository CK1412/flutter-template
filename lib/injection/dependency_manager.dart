import '../../app_flavor_config.dart';
import '../data/api/client/dio_http_client_builder.dart';
import '../data/api/interceptor/cache_request_interceptor.dart';
import '../data/data_sources/rest_api_data_source.dart';
import 'injector.dart';

class DependencyManager {
  static void inject(AppFlavorConfig appFlavorConfig) {
    getIt
      ..registerLazySingleton<AppFlavorConfig>(() => appFlavorConfig)
      ..registerLazySingleton<RestApiDataSource>(
        () => RestApiDataSource(
          DioHttpClientBuilder.createDio(
            interceptors: [
              CacheRequestInterceptor(),
            ],
          ),
          baseUrl: getIt<AppFlavorConfig>().apiConfig.apiUrl,
        ),
      );

    configureDependencies();
  }
}
