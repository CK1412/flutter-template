import 'package:dio/dio.dart';

import 'base_interceptor.dart';

/// [CacheRequestInterceptor] is a simple cache for requests.
/// If the request fails with a connection timeout error,
/// this interceptor checks if there is a request it has saved
/// for the same endpoint request, with the same parameters,
/// then it returns a response old.
class CacheRequestInterceptor extends BaseInterceptor {
  CacheRequestInterceptor();

  @override
  int get priority => BaseInterceptor.cacheRequestPriority;

  final Map<Uri, Response> _cache = <Uri, Response>{};

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _cache[response.realUri] = response;
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout) {
      final Response? cachedResponse = _cache[err.requestOptions.uri];
      if (cachedResponse != null) {
        return handler.resolve(cachedResponse);
      }
    }
    return super.onError(err, handler);
  }
}
