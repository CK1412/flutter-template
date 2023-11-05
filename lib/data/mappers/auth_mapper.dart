import 'package:injectable/injectable.dart';

import '../../domain/entities/auth/user_info_entity.dart';
import '../../shared/exceptions/mapper_exception.dart';
import '../models/auth/user_info_data_model.dart';

@LazySingleton()
class AuthMapper {
  UserInfoEntity toUserInfo(UserInfoDataModel dataModel) {
    try {
      return UserInfoEntity(
        userId: dataModel.userId,
        token: dataModel.token,
        userName: dataModel.userName,
      );
    } catch (e) {
      throw MapperException<UserInfoDataModel, UserInfoEntity>(e.toString());
    }
  }
}
