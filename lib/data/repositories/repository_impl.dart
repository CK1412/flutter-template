import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/repository.dart';
import '../../injection/injector.dart';
import '../../shared/exceptions/app_exception.dart';
import '../../shared/exceptions/error_handler.dart';
import '../../shared/exceptions/remote_exception.dart';
import '../data_sources/rest_api_data_source.dart';

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  @override
  RestApiDataSource get restApiDataSource => getIt<RestApiDataSource>();

  @override
  AppException onBadResponseException(
    String? message, {
    String? messageCode,
    Map<String, dynamic>? responseData,
  }) {
    final exception = BadResponseException(
      message: message,
      messageCode: messageCode,
      responseData: responseData,
    );

    ErrorHandler().reportError(exception);

    return exception;
  }

  @override
  AppException onException(Exception e) {
    ErrorHandler().reportError(e);

    if (e is AppException) {
      return e;
    }

    if (e is DioException) {
      final error = e.error;

      if (error is AppException) {
        return error;
      }
    }

    return AppException(message: e.toString());
  }

  @override
  bool isSuccess(String result) {
    // TODO: implement isSuccess according to your api format
    throw UnimplementedError();
  }
}
