import 'package:dio/dio.dart';

import '../interceptor/custom_log_interceptor.dart';
import '../network_config.dart';

class DioHttpClientBuilder {
  static Dio createDio({
    BaseOptions? options,
  }) {
    final dio = Dio(
      BaseOptions(
        contentType: options?.contentType ?? NetworkConfig.contentType,
        receiveTimeout: options?.receiveTimeout ?? NetworkConfig.receiveTimeout,
        connectTimeout: options?.connectTimeout ?? NetworkConfig.connectTimeout,
        sendTimeout: options?.sendTimeout ?? NetworkConfig.sendTimeout,
      ),
    );

    dio.interceptors.add(CustomLogInterceptor());
    return dio;
  }
}
