import '../../../data/data_sources/remote/rest_api_data_source.dart';
import '../../../data/data_storage/secure_storage/secure_storage_client.dart';
import '../../../data/data_storage/shared_preferences/shared_preferences_client.dart';
import '../../../shared/exceptions/app_exception.dart';

abstract class Repository {
  RestApiDataSource get restApiDataSource;

  SecureStorageClient get secureStorageClient;

  SharedPreferencesClient get sharedPreferencesClient;

  AppException onException(Exception exception);

  AppException onBadResponseException(
    String? message, {
    String? messageCode,
    Map<String, dynamic>? responseData,
  });

  bool isSuccess(String result);
}
