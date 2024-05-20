import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../data/data_storage/secure_storage/secure_storage_client.dart';
import '../../injection/injector.dart';
import '../../shared/mixin/log_mixin.dart';
import '../../shared/utils/toast_utils.dart';
import '../data_storage/models/local_user_data.dart';
import '../data_storage/secure_storage/secure_storage_key.dart';
import '../data_storage/shared_preferences/shared_preferences_client.dart';
import '../data_storage/shared_preferences/shared_preferences_key.dart';

/// Use instance of SessionManager to store user data used in the [application].
base class SessionManager extends ChangeNotifier with LogMixin {
  SessionManager._();

  static SessionManager? _instance;

  static SessionManager instance = _instance ??= SessionManager._();

  SecureStorageClient get _secureStorageClient => getIt<SecureStorageClient>();

  SharedPreferencesClient get _sharedPreferencesClient =>
      getIt<SharedPreferencesClient>();

  String? accessToken;
  String? refreshToken;
  LocalUserData? userData;

  bool get isLoggedIn => accessToken != null;

  bool get canRefreshToken => refreshToken != null;

  Future<void> init() async {
    try {
      await _clearSecureStorageOnReinstall();

      accessToken = await readAccessToken();
      refreshToken = await readRefreshToken();
      userData = await readUserData();

      _registerDataListener();

      logD('Session initialization successful');
    } catch (e) {
      logE('Session initialization failed.', error: e);
    } finally {
      notifyListeners();
    }
  }

  void _registerDataListener() {
    _secureStorageClient.storage.registerListener(
      key: SecureStorageKey.accessToken,
      listener: (value) {
        accessToken = value;
        notifyListeners();
      },
    );
    _secureStorageClient.storage.registerListener(
      key: SecureStorageKey.refreshToken,
      listener: (value) {
        refreshToken = value;
        notifyListeners();
      },
    );
    _secureStorageClient.storage.registerListener(
      key: SecureStorageKey.userData,
      listener: (value) {
        userData =
            value != null ? LocalUserData.fromJson(jsonDecode(value)) : null;
        notifyListeners();
      },
    );
  }

  bool _isClearing = false;

  /// [message], which provides the usage context.
  /// [displayMessage], which uses to display notifications to the user interface.
  Future<void> clearSession({
    String? message,
    String? displayMessage,
  }) async {
    if (_isClearing) {
      return;
    }

    try {
      _isClearing = true;

      accessToken = null;
      refreshToken = null;
      await _secureStorageClient.delete(SecureStorageKey.accessToken);
      await _secureStorageClient.delete(SecureStorageKey.refreshToken);

      logD('Current session data has been cleaned');

      if (displayMessage != null) {
        ToastUtils.showMessage(displayMessage);
      }
    } catch (e) {
      logE('An error occurred while cleaning session data', error: e);
    } finally {
      _isClearing = false;
      notifyListeners();
    }
  }

  @protected
  Future<String?> readAccessToken() async {
    return await _secureStorageClient.read(SecureStorageKey.accessToken);
  }

  @protected
  Future<String?> readRefreshToken() async {
    return await _secureStorageClient.read(SecureStorageKey.refreshToken);
  }

  @protected
  Future<LocalUserData?> readUserData() async {
    final String? jsonData =
        await _secureStorageClient.read(SecureStorageKey.userData);

    if (jsonData != null) {
      return LocalUserData.fromJson(jsonDecode(jsonData));
    }
    return null;
  }

  Future<void> saveAccessToken(String value) async {
    await _secureStorageClient.write(SecureStorageKey.accessToken, value);
  }

  Future<void> saveRefreshToken(String value) async {
    await _secureStorageClient.write(SecureStorageKey.refreshToken, value);
  }

  Future<void> saveUserData(LocalUserData value) async {
    final String jsonData = jsonEncode(value.toJson());
    await _secureStorageClient.write(SecureStorageKey.userData, jsonData);
  }

  /// Issues: https://github.com/mogol/flutter_secure_storage/issues/88
  ///
  Future<void> _clearSecureStorageOnReinstall() async {
    const String key = SharedPreferencesKey.thisAppHasRunBefore;
    if (_sharedPreferencesClient.containsKey(key)) {
      final bool? hasRunBefore = _sharedPreferencesClient.getBool(key);

      if (hasRunBefore ?? false) {
        return;
      }
    }

    await _secureStorageClient.clearAll();
    await _sharedPreferencesClient.write(
      key,
      true,
    );
  }
}
