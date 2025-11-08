import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocalDataSource {
  static const String _keyLastGateType = 'last_gate_type';
  static const String _keyDarkMode = 'dark_mode';

  final SharedPreferences _prefs;

  PreferencesLocalDataSource(this._prefs);

  Future<String?> getLastGateType() async {
    return _prefs.getString(_keyLastGateType);
  }

  Future<void> saveLastGateType(String gateType) async {
    await _prefs.setString(_keyLastGateType, gateType);
  }

  Future<bool> getDarkMode() async {
    return _prefs.getBool(_keyDarkMode) ?? true; // Default to dark mode
  }

  Future<void> setDarkMode(bool enabled) async {
    await _prefs.setBool(_keyDarkMode, enabled);
  }
}
