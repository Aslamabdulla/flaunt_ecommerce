import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const _keyLogin = 'firstTime';
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static Future setLogin(bool login) async {
    await _preferences.setBool(_keyLogin, login);
  }

  static bool? getLogin() => _preferences.getBool(_keyLogin);
}
