import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class SharedPreferencesService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> clearData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }

  Future<bool> getBoolValue(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key) ?? false;
  }

  Future<void> setBoolValue(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(key, value);
  }

  Future<bool> getLoginStatus() async {
    try {
      final SharedPreferences prefs = await _prefs;
      return prefs.getBool('is_loggedIn') ?? false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> setLoginStatus(bool isLoggedIn) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('is_loggedIn', isLoggedIn);
  }
}
