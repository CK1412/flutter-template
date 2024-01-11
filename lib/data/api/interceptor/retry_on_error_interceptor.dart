import 'package:dio/dio.dart';

import 'base_interceptor.dart';

class RetryOnErrorInterceptor extends BaseInterceptor {
  final Dio dio;

  RetryOnErrorInterceptor(this.dio);

  @override
  int get priority => BaseInterceptor.retryOnErrorPriority;

  static const _keyIsRetry = 'is_retry';
  static const _keyRetryCount = 'retry_count';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!options.headers.containsKey(_keyIsRetry)) {
      options.headers[_keyRetryCount] = RetryOnErrorConstants.maxRetries;
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    assert(
      err.requestOptions.headers[_keyRetryCount] != null,
      'value of _keyRetryCount must not be null',
    );
    final int retryCount = err.requestOptions.headers[_keyRetryCount] as int;
    if (retryCount > 0 && _shouldRetry(err)) {
      await Future.delayed(RetryOnErrorConstants.retryInterval);
      try {
        final response = await dio.fetch<dynamic>(
          err.requestOptions
            ..headers[_keyIsRetry] = true
            ..headers[_keyRetryCount] = retryCount - 1,
        );

        return handler.resolve(response);
      } catch (_) {
        return super.onError(err, handler);
      }
    }

    super.onError(err, handler);
  }

  bool _shouldRetry(DioException err) {
    return err.type != DioExceptionType.cancel &&
        err.type != DioExceptionType.badResponse;
  }
}

class RetryOnErrorConstants {
  const RetryOnErrorConstants._();

  static int maxRetries = 1;
  static Duration retryInterval = const Duration(seconds: 2);
}
