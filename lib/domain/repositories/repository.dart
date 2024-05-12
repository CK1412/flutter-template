import '../../data/data_sources/rest_api_data_source.dart';
import '../../shared/exceptions/app_exception.dart';

abstract class Repository {
  RestApiDataSource get restApiDataSource;

  AppException onException(Exception exception);

  AppException onBadResponseException(
    String? message, {
    String? messageCode,
    Map<String, dynamic>? responseData,
  });

  bool isSuccess(String result);
}
