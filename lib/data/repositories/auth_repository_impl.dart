import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../domain/entities/auth/user_info_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../l10n/generated/l10n.dart';
import '../data_sources/remote_data_source.dart';
import '../mappers/auth_mapper.dart';
import '../session/session_manager.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource, this._mapper);

  final RemoteDataSource _remoteDataSource;
  final AuthMapper _mapper;

  @override
  Future<UserInfoEntity?> signUp(String userName, String password) async {
    try {
      final response = await _remoteDataSource.signUp(userName, password);

      if (response != null) {
        final userInfo = _mapper.toUserInfo(response);
        SessionManager.userInfo = userInfo;
        return userInfo;
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }

  @override
  Future<UserInfoEntity?> loginWithPassword(
    String userName,
    String password,
  ) async {
    try {
      final response =
          await _remoteDataSource.loginWithPassword(userName, password);

      if (response != null) {
        final userInfo = _mapper.toUserInfo(response);
        SessionManager.userInfo = userInfo;
        return userInfo;
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }

  @override
  Future<bool> logOut() async {
    try {
      final response = await _remoteDataSource.logOut();
      if (response) {
        unawaited(
          SessionManager.clear(
            message: "User log out",
            displayMessage: L.current.youHaveSuccessfullyLoggedOut,
          ),
        );
        return true;
      }
    } catch (e) {
      rethrow;
    }

    return false;
  }
}
