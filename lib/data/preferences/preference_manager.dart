import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  PreferenceManager._internal();

  factory PreferenceManager() {
    return _instance;
  }

  static final PreferenceManager _instance = PreferenceManager._internal();

  SharedPreferences? _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    await _preferences?.setDouble(key, value);
  }

  Future<void> setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  Future<void> setStringList(String key, List<String> value) async {
    await _preferences?.setStringList(key, value);
  }

  bool? getBool(String key) => _preferences?.getBool(key);

  int? getInt(String key) => _preferences?.getInt(key);

  double? getDouble(String key) => _preferences?.getDouble(key);

  String? getString(String key) => _preferences?.getString(key);

  List<String>? getStringList(String key) => _preferences?.getStringList(key);
}
