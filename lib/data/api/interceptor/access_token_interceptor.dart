import 'dart:io';

import 'package:dio/dio.dart';

import '../../../shared/exceptions/remote_exception.dart';
import '../../session/session_manager.dart';
import 'base_interceptor.dart';

class AccessTokenInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.accessTokenPriority;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? accessToken = SessionManager.instance.accessToken;
    if (accessToken != null) {
      options.headers['Authorization'] = "Bearer $accessToken";
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      SessionManager.instance.clearSession(message: 'unauthorized');
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: UnauthorizedException(),
        ),
      );
    } else {
      return super.onError(err, handler);
    }
  }
}
