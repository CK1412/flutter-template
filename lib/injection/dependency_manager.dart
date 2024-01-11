import '../../app_flavor_config.dart';
import '../data/api/client/dio_http_client_builder.dart';
import '../data/api/interceptor/access_token_interceptor.dart';
import '../data/api/interceptor/cache_request_interceptor.dart';
import '../data/api/interceptor/error_interceptor.dart';
import '../data/api/interceptor/refresh_token_interceptor.dart';
import '../data/data_sources/auth_app_rest_api_data_source.dart';
import '../data/data_sources/non_auth_app_rest_api_data_source.dart';
import 'injector.dart';

class DependencyManager {
  static void inject(AppFlavorConfig appFlavorConfig) {
    getIt
      ..registerLazySingleton<AppFlavorConfig>(() => appFlavorConfig)
      ..registerLazySingleton<AuthAppRestApiDataSource>(
        () => AuthAppRestApiDataSource(
          DioHttpClientBuilder.createDio(
            interceptors: (dio) => [
              CacheRequestInterceptor(),
              ErrorInterceptor(),
              AccessTokenInterceptor(),
              RefreshTokenInterceptor(dio),
            ],
          ),
          baseUrl: getIt<AppFlavorConfig>().apiConfig.apiUrl,
        ),
      )
      ..registerLazySingleton<NonAuthAppRestApiDataSource>(
        () => NonAuthAppRestApiDataSource(
          DioHttpClientBuilder.createDio(
            interceptors: (dio) => [
              CacheRequestInterceptor(),
              ErrorInterceptor(),
            ],
          ),
          baseUrl: getIt<AppFlavorConfig>().apiConfig.apiUrl,
        ),
      );

    configureDependencies();
  }
}
