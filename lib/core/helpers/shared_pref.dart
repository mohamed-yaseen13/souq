import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static bool isUserLoggedIn = false;

  static String userEmail = 'userEmail';

  static Future<void> setUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(userEmail, email);
  }

  static Future<String> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(userEmail) ?? '';
  }

  static Future<void> saveUser(String email) async {
    isUserLoggedIn = true;

    await setUserEmail(email);
  }
}
