import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../app/session/session_manager.dart';
import '../../../domain/entities/auth/auth_info_entity.dart';
import '../../../injection/injector.dart';
import '../../data_sources/auth_app_rest_api_data_source.dart';
import 'base_interceptor.dart';

class RefreshTokenInterceptor extends BaseInterceptor {
  final Dio dio;

  RefreshTokenInterceptor(this.dio);

  @override
  int get priority => BaseInterceptor.refreshTokenPriority;

  AuthAppRestApiDataSource authAppRestApiDataSource() =>
      getIt<AuthAppRestApiDataSource>();

  bool _isRefreshing = false;

  final _queue = Queue<
      (
        RequestOptions requestOptions,
        ErrorInterceptorHandler handler,
      )>();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode != HttpStatus.unauthorized) {
      return super.onError(err, handler);
    } else {
      final RequestOptions requestOptions = err.requestOptions;
      _onTokenExpired(requestOptions, handler);
    }
  }

  Future<void> _onTokenExpired(
    RequestOptions requestOptions,
    ErrorInterceptorHandler handler,
  ) async {
    _queue.addLast((requestOptions, handler));

    if (_isRefreshing) {
      final Response response = await dio.fetch(requestOptions);
      handler.resolve(response);
      return;
    }

    _isRefreshing = true;

    try {
      final String newAccessToken = await _requestNewAccessToken();
      await _onRefreshTokenSuccess(newAccessToken);
    } catch (e) {
      _onTokenRefreshFailed(e);
    } finally {
      _isRefreshing = false;
      _queue.clear();
    }
  }

  void _onTokenRefreshFailed(Object error) {
    for (final requestInfo in _queue) {
      final RequestOptions options = requestInfo.$1;
      final ErrorInterceptorHandler handler = requestInfo.$2;
      handler.next(DioException(requestOptions: options, error: error));
    }
  }

  Future<String> _requestNewAccessToken() async {
    _isRefreshing = true;
    // final String? refreshToken = SessionManager.refreshToken;

    // Call API refreshToken
    const String newAccessToken = '';
    return newAccessToken;
  }

  Future<void> _onRefreshTokenSuccess(String newAccessToken) async {
    final AuthInfoEntity? currentAuthInfo = SessionManager.authInfo;
    SessionManager.authInfo = currentAuthInfo?.copyWith(token: newAccessToken);

    await Future.wait(
      _queue.map(
        (requestInfo) => _requestWithNewAccessToken(
          requestInfo.$1,
          requestInfo.$2,
          newAccessToken,
        ),
      ),
    );
  }

  Future<void> _requestWithNewAccessToken(
    RequestOptions options,
    ErrorInterceptorHandler handler,
    String newAccessToken,
  ) async {
    _putAccessTokenInHeaders(
      headers: options.headers,
      accessToken: newAccessToken,
    );

    try {
      final response = await dio.fetch(options);
      handler.resolve(response);
    } catch (e) {
      handler.next(DioException(requestOptions: options, error: e));
    }
  }

  void _putAccessTokenInHeaders({
    required Map<String, dynamic> headers,
    required String accessToken,
  }) {
    headers['Authorization'] = "Bearer $accessToken";
  }
}
