import 'package:injectable/injectable.dart';

import '../../../domain/entities/user_entity.dart';
import '../../base/base_data_mapper.dart';
import '../model/data/api_user_data.dart';

@injectable
class ApiUserDataMapper extends BaseDataMapper<ApiUserData, UserEntity> {
  @override
  UserEntity mapToEntity(ApiUserData? data) {
    return UserEntity(
      id: data?.id ?? UserEntity.defaultId,
      email: data?.email ?? UserEntity.defaultEmail,
      firstName: data?.firstName ?? UserEntity.defaultFirstName,
      lastName: data?.lastName ?? UserEntity.defaultLastName,
      avatar: data?.avatar ?? UserEntity.defaultAvatar,
    );
  }
}
