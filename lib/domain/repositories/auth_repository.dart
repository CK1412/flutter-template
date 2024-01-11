import '../entities/auth/auth_info_entity.dart';

abstract class AuthRepository {
  Future<AuthInfoEntity?> register(String email, String password);

  Future<AuthInfoEntity?> login(String email, String password);

  Future<bool> logOut();
}
