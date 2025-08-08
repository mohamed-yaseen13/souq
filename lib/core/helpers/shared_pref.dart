import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final String isUserLoggedInKay = 'isUserLoggedIn';

  static Future<void> setIsUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(isUserLoggedInKay, true);
  }

  static Future<bool> getIsUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(isUserLoggedInKay) ?? false;
  }
  //
  //static final String userEmailKey = 'userEmail';
  //
  //static Future<void> setUserEmail(String email) async {
  //  final prefs = await SharedPreferences.getInstance();
  //
  //  await prefs.setString(userEmailKey, email);
  //}
  //
  //static Future<String> getUserEmail() async {
  //  final prefs = await SharedPreferences.getInstance();
  //
  //  return prefs.getString(userEmailKey) ?? '';
  //}

  static const String userIdKey = 'userId';

  static Future<void> setUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(userIdKey, id);
  }

  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(userIdKey) ?? '';
  }

  static Future<void> saveUser(String id) async {
    await setIsUserLoggedIn();

    await setUserId(id);
  }
}
