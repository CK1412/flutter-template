import '../../app_flavor_config.dart';
import '../data/api/client/dio_http_client_builder.dart';
import '../data/api/interceptor/access_token_interceptor.dart';
import '../data/api/interceptor/cache_request_interceptor.dart';
import '../data/api/interceptor/error_interceptor.dart';
import '../data/api/interceptor/refresh_token_interceptor.dart';
import '../data/api/interceptor/retry_on_error_interceptor.dart';
import '../data/data_sources/remote/rest_api_data_source.dart';
import 'injector.dart';

class DependencyManager {
  static Future<void> inject(AppFlavorConfig appFlavorConfig) async {
    getIt
      ..registerLazySingleton<AppFlavorConfig>(() => appFlavorConfig)
      ..registerLazySingleton<RestApiDataSource>(
        () => RestApiDataSource(
          DioHttpClientBuilder.createDio(
            interceptors: (dio) => [
              CacheRequestInterceptor(),
              ErrorInterceptor(),
              AccessTokenInterceptor(),
              RefreshTokenInterceptor(dio),
              RetryOnErrorInterceptor(dio),
            ],
          ),
          baseUrl: getIt<AppFlavorConfig>().apiConfig.apiUrl,
        ),
      );

    await configureDependencies();
  }
}
