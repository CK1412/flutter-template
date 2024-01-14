import 'package:dio/dio.dart';

import '../../../app/session/session_manager.dart';
import 'base_interceptor.dart';

class AccessTokenInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.accessTokenPriority;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? accessToken = SessionManager.accessToken;
    if (accessToken != null) {
      options.headers['Authorization'] = "Bearer $accessToken";
    }

    super.onRequest(options, handler);
  }
}
