import 'package:injectable/injectable.dart';

import '../../domain/repositories/repository.dart';
import '../../injection/injector.dart';
import '../data_sources/rest_api_data_source.dart';

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  @override
  RestApiDataSource restApiDataSource() => getIt<RestApiDataSource>();
}
