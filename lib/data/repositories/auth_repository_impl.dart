import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../l10n/generated/l10n.dart';
import '../api/model/request/login_request.dart';
import '../api/model/request/register_request.dart';
import '../api/model/response/login_response.dart';
import '../api/model/response/register_response.dart';
import '../data_storage/models/user_local_data.dart';
import '../session/session_manager.dart';
import 'base/repository_impl.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends RepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<bool> login(
    String email,
    String password,
  ) async {
    try {
      final LoginRequest request = LoginRequest(
        email: email,
        password: password,
      );

      final LoginResponse response = await restApiDataSource.login(request);

      await SessionManager.instance.saveAccessToken(response.token);
      await SessionManager.instance.saveUserData(const UserLocalData());

      return true;
    } on Exception catch (e) {
      throw onException(e);
    }
  }

  @override
  Future<bool> logOut() async {
    try {
      // final response = await restApiDataSource().logOut();
      const response = true;
      if (response) {
        unawaited(
          SessionManager.instance.clearSession(
            message: "User log out",
            displayMessage: L.current.lbl_you_have_successfully_logged_out,
          ),
        );
        return true;
      }
    } on Exception catch (e) {
      throw onException(e);
    }
  }

  @override
  Future<bool> register(String email, String password) async {
    try {
      final RegisterRequest request = RegisterRequest(
        email: email,
        password: password,
      );

      final RegisterResponse response =
          await restApiDataSource.register(request);

      await SessionManager.instance.saveAccessToken(response.token);
      await SessionManager.instance.saveUserData(
        UserLocalData(id: response.id),
      );

      return true;
    } on Exception catch (e) {
      throw onException(e);
    }
  }
}
