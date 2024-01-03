import 'package:dio/dio.dart';

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

    return dio;
  }
}
