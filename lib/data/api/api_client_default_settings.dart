import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'interceptor/connectivity_interceptor.dart';
import 'interceptor/custom_log_interceptor.dart';

class ApiClientDefaultSettings {
  ApiClientDefaultSettings._();

  // required interceptors
  static List<Interceptor> requiredInterceptors() => [
        if (kDebugMode) CustomLogInterceptor(),
        ConnectivityInterceptor(),
      ];
}
