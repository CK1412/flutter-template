import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_template/data/models/user_login_model.dart';
import 'package:flutter_web_template/data/session/session_call_back.dart';
import 'package:flutter_web_template/shared/extensions/string_extension.dart';
import 'package:flutter_web_template/shared/logger/logger.dart';

const String _keyLanguageCode = 'key_language_code';
const String _keyUserLoginModel = 'key_user_login_model';

/// Use instance of SessionManager to store user data used in the [application].
class SessionManager {
  SessionManager._();

  static late FlutterSecureStorage _prefs;

  /// All callback listeners for this session.
  static final Map<String, SessionCallback> _availableListeners = {};

  static late String? _languageCode;
  static UserLoginModel? _userLoginInfo;

  static UserLoginModel? get userLoginInfo => _userLoginInfo;

  static set userLoginInfo(UserLoginModel? value) {
    _userLoginInfo = value;
    _saveCurrentUserLoginInfo();
  }

  static String? get accessToken => _userLoginInfo?.token;

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
    final String? userLoginDataString = await _prefs.read(
      key: _keyUserLoginModel,
    );

    if (userLoginDataString.isNotNullAndNotEmpty) {
      try {
        final UserLoginModel lastUserLogin = UserLoginModel.fromJson(
          jsonDecode(userLoginDataString!),
        );

        _userLoginInfo = lastUserLogin;
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
      await _deleteCurrentUserLoginInfo();

      await Future.forEach(_availableListeners.values, (element) async {
        element.onSessionChanged(message: displayMessage);
      });
    } catch (e) {
      logger.e('Clearing session data failed.', error: e);
    } finally {
      _isClearing = false;
    }
  }

  static String get languageCode => _languageCode ?? 'vi';

  static set languageCode(String value) {
    _languageCode = value;

    _saveCurrentLanguageCode();
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

  /// Register an [AvailableListener] which is called session changed.
  static void addAvailableListener(
    String? message, {
    required String key,
    required SessionCallback listener,
  }) {
    _availableListeners[key]?.onListenerRemoved();
    _availableListeners[key] = listener;
    logger.i('addAvailableListener: add listener ${message ?? ''}');
  }

  static void removeAvailableListener(String key, {String? message}) {
    _availableListeners[key]?.onListenerRemoved();
    _availableListeners.remove(key);
    logger.i('removeAvailableListener: remove listener ${message ?? ''}');
  }

  static Future<void> _saveCurrentUserLoginInfo() async {
    try {
      final String dataString = jsonEncode(_userLoginInfo);
      await _prefs.write(key: _keyUserLoginModel, value: dataString);
    } catch (e) {
      logger.e('_saveCurrentUserLoginInfo() run failed.', error: e);
    }
  }

  static Future<void> _deleteCurrentUserLoginInfo() async {
    try {
      await _prefs.delete(key: _keyUserLoginModel);
      _userLoginInfo = null;
    } catch (e) {
      logger.e('_deleteCurrentUserLoginInfo() run failed.', error: e);
    }
  }
}
