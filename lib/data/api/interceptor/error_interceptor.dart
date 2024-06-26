import 'package:dio/dio.dart';

import '../../../shared/exceptions/remote_exception.dart';
import 'base_interceptor.dart';

class ErrorInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.errorPriority;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final int? statusCode = err.response?.statusCode;

    if (statusCode != null && isServerError(statusCode)) {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: ServerException(messageCode: statusCode.toString()),
        ),
      );
    }

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: ConnectionTimeoutException(),
          ),
        );
      case DioExceptionType.badResponse:
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: BadResponseException(
              responseData: err.response?.data,
            ),
          ),
        );
      case DioExceptionType.badCertificate:
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: BadCertificateException(),
          ),
        );
      case DioExceptionType.cancel:
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: CancelledRequestException(),
          ),
        );
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: NoInternetException(),
          ),
        );
    }
  }

  bool isServerError(int statusCode) {
    return statusCode.toString()[0] == '5';
  }
}
