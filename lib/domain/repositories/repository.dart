import '../../data/data_sources/auth_app_rest_api_data_source.dart';
import '../../data/data_sources/non_auth_app_rest_api_data_source.dart';

abstract class Repository {
  AuthAppRestApiDataSource authAppRestApiDataSource();
  NonAuthAppRestApiDataSource nonAuthAppRestApiDataSource();
}
