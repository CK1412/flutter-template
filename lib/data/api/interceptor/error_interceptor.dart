import 'package:dio/dio.dart';

import '../../../shared/exceptions/remote_exception.dart';
import 'base_interceptor.dart';

class ErrorInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.errorPriority;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: ConnectionTimeoutException(),
          ),
        );
      case DioExceptionType.badResponse:
        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: BadResponseException(),
          ),
        );
      case DioExceptionType.badCertificate:
        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: BadCertificateException(),
          ),
        );
      case DioExceptionType.cancel:
        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: CancelledRequestException(),
          ),
        );
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: NoInternetException(),
          ),
        );
    }
  }
}
