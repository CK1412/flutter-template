import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';

import '../api_client_default_settings.dart';
import '../interceptor/base_interceptor.dart';
import '../network_config.dart';

class DioHttpClientBuilder {
  static Dio createDio({
    BaseOptions? options,
    List<Interceptor> Function(Dio dio)? interceptors,
  }) {
    final Dio dio = Dio(
      BaseOptions(
        contentType: options?.contentType ?? NetworkConfig.contentType,
        receiveTimeout: options?.receiveTimeout ?? NetworkConfig.receiveTimeout,
        connectTimeout: options?.connectTimeout ?? NetworkConfig.connectTimeout,
        sendTimeout: options?.sendTimeout ?? NetworkConfig.sendTimeout,
      ),
    );

    final List<Interceptor> sortedInterceptors = [
      ...ApiClientDefaultSettings.requiredInterceptors(),
      ...?interceptors?.call(dio),
    ]
      ..distinct()
      ..sortedByDescending(
        (element) => element is BaseInterceptor ? element.priority : -1,
      );

    dio.interceptors.addAll(sortedInterceptors);
    return dio;
  }
}
