import 'package:flutter_web_template/domain/entities/auth/user_info_entity.dart';

abstract class AuthRepository {
  Future<UserInfoEntity?> signUp(String userName, String password);

  Future<UserInfoEntity?> loginWithPassword(String userName, String password);

  Future<bool> logOut();
}
