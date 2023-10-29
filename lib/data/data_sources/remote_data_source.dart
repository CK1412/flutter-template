import 'package:flutter_web_template/data/models/auth/user_info_data_model.dart';

class RemoteDataSource {
  Future<UserInfoDataModel?> signUp(
    String userName,
    String password,
  ) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return UserInfoDataModel(
          userId: 1010,
          token: 'ssifUSAUcsdcs2e88sfs',
          userName: userName,
        );
      },
    );
  }

  Future<UserInfoDataModel?> loginWithPassword(
    String userName,
    String password,
  ) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return UserInfoDataModel(
          userId: 1010,
          token: 'ssifUSAUcsdcs2e88sfs',
          userName: userName,
        );
      },
    );
  }

  Future<bool> logOut() {
    return Future.value(true);
  }
}
