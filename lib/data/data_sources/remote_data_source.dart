import 'package:injectable/injectable.dart';

import '../models/auth/user_info_data_model.dart';

@LazySingleton()
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
