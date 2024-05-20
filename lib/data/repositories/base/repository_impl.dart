import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/base/repository.dart';
import '../../../injection/injector.dart';
import '../../../shared/exceptions/app_exception.dart';
import '../../../shared/exceptions/error_handler.dart';
import '../../../shared/exceptions/remote_exception.dart';
import '../../../shared/mixin/log_mixin.dart';
import '../../data_sources/remote/rest_api_data_source.dart';
import '../../data_storage/secure_storage/secure_storage_client.dart';
import '../../data_storage/shared_preferences/shared_preferences_client.dart';

@LazySingleton(as: Repository)
class RepositoryImpl with LogMixin implements Repository {
  @override
  RestApiDataSource get restApiDataSource => getIt<RestApiDataSource>();

  @override
  SecureStorageClient get secureStorageClient => getIt<SecureStorageClient>();

  @override
  SharedPreferencesClient get sharedPreferencesClient =>
      getIt<SharedPreferencesClient>();

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

    logE(message, error: exception);
    ErrorHandler().reportError(exception);

    return exception;
  }

  @override
  AppException onException(Exception e) {
    logE(e.toString(), error: e);
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
