import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../api/mapper/api_user_data_mapper.dart';
import '../api/model/response/get_single_user_response.dart';
import 'base/repository_impl.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends RepositoryImpl implements UserRepository {
  final ApiUserDataMapper _apiUserDataMapper;

  UserRepositoryImpl(this._apiUserDataMapper);

  @override
  Future<UserEntity> getSingleUser(int id) async {
    try {
      final GetSingleUserResponse response =
          await restApiDataSource.getSingleUser(id);

      return _apiUserDataMapper.mapToEntity(response.data);
    } on Exception catch (e) {
      throw onException(e);
    }
  }
}
