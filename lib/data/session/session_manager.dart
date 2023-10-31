import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_template/domain/entities/auth/user_info_entity.dart';
import 'package:flutter_web_template/shared/extensions/string_extension.dart';
import 'package:flutter_web_template/shared/logger/logger.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String _keyLanguageCode = 'key_language_code';
const String _keyUserInfo = 'key_user_info';

/// Use instance of SessionManager to store user data used in the [application].
class SessionManager {
  SessionManager._();

  static late FlutterSecureStorage _prefs;

  static late String? _languageCode;
  static UserInfoEntity? _userInfo;

  static UserInfoEntity? get userInfo => _userInfo;

  static set userInfo(UserInfoEntity? value) {
    _userInfo = value;
    unawaited(_saveCurrentUserInfo());
  }

  static String? get accessToken => _userInfo?.token;

  static bool get isLoggedIn => accessToken != null;

  static Future<void> init() async {
    _prefs = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );

    await _restoreLastSession();
    await _restoreCurrentLanguageCode();
  }

  static Future<bool> _restoreLastSession() async {
    final String? userInfoDataString = await _prefs.read(
      key: _keyUserInfo,
    );

    if (userInfoDataString.isNotNullAndNotEmpty) {
      try {
        final UserInfoEntity lastUserInfo = UserInfoEntity.fromJson(
          jsonDecode(userInfoDataString!),
        );

        _userInfo = lastUserInfo;
        return true;
      } catch (e) {
        return false;
      }
    }

    return false;
  }

  static bool _isClearing = false;

  static bool get isClearing => _isClearing;

  /// [message], which provides the usage context.
  /// [displayMessage], which uses to display notifications to the user interface.
  static Future<void> clear({
    String? message,
    String? displayMessage,
  }) async {
    if (_isClearing) {
      return;
    }
    try {
      _isClearing = true;
      await _deleteCurrentUserInfo();

      if (displayMessage != null) {
        unawaited(
          Fluttertoast.showToast(msg: displayMessage, timeInSecForIosWeb: 2),
        );
      }
    } catch (e) {
      logger.e('Clearing session data failed.', error: e);
    }

    _isClearing = false;
  }

  static String get languageCode => _languageCode ?? 'vi';

  static set languageCode(String value) {
    _languageCode = value;

    unawaited(_saveCurrentLanguageCode());
  }

  static Future<void> _saveCurrentLanguageCode() async {
    try {
      await _prefs.write(key: _keyLanguageCode, value: _languageCode);
    } catch (e) {
      logger.e('_saveCurrentLanguageCode() run failed.', error: e);
    }
  }

  static Future<void> _restoreCurrentLanguageCode() async {
    try {
      _languageCode = await _prefs.read(key: _keyLanguageCode);
    } catch (e) {
      logger.e('_restoreCurrentLanguageCode() run failed.', error: e);
    }
  }

  static Future<void> _saveCurrentUserInfo() async {
    try {
      final String dataString = jsonEncode(_userInfo);
      await _prefs.write(key: _keyUserInfo, value: dataString);
    } catch (e) {
      logger.e('_saveCurrentUserInfo() run failed.', error: e);
    }
  }

  static Future<void> _deleteCurrentUserInfo() async {
    try {
      await _prefs.delete(key: _keyUserInfo);
      _userInfo = null;
    } catch (e) {
      logger.e('_deleteCurrentUserInfo() run failed.', error: e);
    }
  }
}
