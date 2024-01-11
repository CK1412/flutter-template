import 'package:injectable/injectable.dart';

import '../../domain/repositories/repository.dart';
import '../../injection/injector.dart';
import '../data_sources/auth_app_rest_api_data_source.dart';
import '../data_sources/non_auth_app_rest_api_data_source.dart';

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  @override
  AuthAppRestApiDataSource authAppRestApiDataSource() =>
      getIt<AuthAppRestApiDataSource>();

  @override
  NonAuthAppRestApiDataSource nonAuthAppRestApiDataSource() =>
      getIt<NonAuthAppRestApiDataSource>();
}
