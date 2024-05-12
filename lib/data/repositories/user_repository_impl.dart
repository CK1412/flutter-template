import 'package:injectable/injectable.dart';

import '../../domain/entities/user/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../mapper/user_data_mapper.dart';
import '../models/api/response/get_single_user_response.dart';
import 'repository_impl.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends RepositoryImpl implements UserRepository {
  final UserDataMapper _userDataMapper;

  UserRepositoryImpl(this._userDataMapper);

  @override
  Future<UserEntity> getSingleUser(int id) async {
    try {
      final GetSingleUserResponse response =
          await restApiDataSource.getSingleUser(id);

      return _userDataMapper.toUser(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
