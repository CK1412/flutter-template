import 'package:flutter_web_template/data/mappers/base/mapper_exception.dart';
import 'package:flutter_web_template/data/models/auth/user_info_data_model.dart';
import 'package:flutter_web_template/domain/entities/auth/user_info_entity.dart';
import 'package:injectable/injectable.dart';

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
