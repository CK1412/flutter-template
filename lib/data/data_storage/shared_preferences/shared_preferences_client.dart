import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
base class SharedPreferencesClient {
  @FactoryMethod(preResolve: true)
  static Future<SharedPreferencesClient> init() async {
    _prefs = await SharedPreferences.getInstance();

    return SharedPreferencesClient();
  }

  static late final SharedPreferences _prefs;

  SharedPreferences get prefs => _prefs;

  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<bool> write(String key, Object value) async {
    final List<Type> valueTypeSupported = [
      String,
      int,
      double,
      bool,
      List<String>,
    ];

    assert(
      valueTypeSupported.contains(value.runtimeType),
      'Only allowed value types are String, int, double, bool, List<String>',
    );

    if (value is String) {
      return await _prefs.setString(key, value);
    }
    if (value is int) {
      return await _prefs.setInt(key, value);
    }
    if (value is double) {
      return await _prefs.setDouble(key, value);
    }
    if (value is bool) {
      return await _prefs.setBool(key, value);
    }
    if (value is List<String>) {
      return await _prefs.setStringList(key, value);
    }

    return false;
  }

  Future<bool> delete(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> clearAll() async {
    return await _prefs.clear();
  }
}
