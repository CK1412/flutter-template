import 'dart:async';

import 'package:flutter_web_template/data/data_sources/remote_data_source.dart';
import 'package:flutter_web_template/data/mappers/auth_mapper.dart';
import 'package:flutter_web_template/data/session/session_manager.dart';
import 'package:flutter_web_template/domain/entities/auth/user_info_entity.dart';
import 'package:flutter_web_template/domain/repositories/auth_repository.dart';

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
        unawaited(SessionManager.clear(message: "User log out"));
        return true;
      }
    } catch (e) {
      rethrow;
    }

    return false;
  }
}
