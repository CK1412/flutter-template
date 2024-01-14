import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../app/session/session_manager.dart';
import '../../domain/entities/auth/auth_info_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../l10n/generated/l10n.dart';
import '../models/api/request/login_request.dart';
import '../models/api/request/register_request.dart';
import '../models/api/response/login_response.dart';
import '../models/api/response/register_response.dart';
import 'repository_impl.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends RepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<AuthInfoEntity?> login(
    String email,
    String password,
  ) async {
    try {
      final LoginRequest request = LoginRequest(
        email: email,
        password: password,
      );

      final LoginResponse response =
          await nonAuthAppRestApiDataSource().login(request);

      final AuthInfoEntity authInfo = AuthInfoEntity(
        token: response.token,
      );
      _saveAuthInfo(authInfo);

      return authInfo;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> logOut() async {
    try {
      // final response = await restApiDataSource().logOut();
      const response = true;
      if (response) {
        unawaited(
          SessionManager.clear(
            message: "User log out",
            displayMessage: L.current.lbl_you_have_successfully_logged_out,
          ),
        );
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthInfoEntity?> register(String email, String password) async {
    try {
      final RegisterRequest request = RegisterRequest(
        email: email,
        password: password,
      );
      final RegisterResponse response =
          await nonAuthAppRestApiDataSource().register(request);

      final AuthInfoEntity authInfo = AuthInfoEntity(
        id: response.id,
        token: response.token,
      );
      _saveAuthInfo(authInfo);

      return authInfo;
    } catch (e) {
      rethrow;
    }
  }

  void _saveAuthInfo(AuthInfoEntity authInfo) {
    SessionManager.authInfo = authInfo;
  }
}
