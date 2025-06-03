import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static Future<void> saveLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', value);
  }

  static Future<bool> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }

  static Future<void> deleteLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLogin');
  }
}
