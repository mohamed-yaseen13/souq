import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq/core/models/user_model.dart';

class SharedPref {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // is user logged in key
  static const String isUserLoggedInKay = 'isUserLoggedIn';

  // set user logged in
  static Future<void> setIsUserLoggedIn() async {
    await _prefs!.setBool(isUserLoggedInKay, true);
  }

  // get user logged in
  static bool getIsUserLoggedIn() {
    return _prefs!.getBool(isUserLoggedInKay) ?? false;
  }

  // user id key
  static const String userIdKey = 'userId';

  // set user id
  static Future<void> setUserId(String id) async {
    await _prefs!.setString(userIdKey, id);
  }

  // get user id
  static String getUserId() {
    return _prefs!.getString(userIdKey) ?? '';
  }

  // user name key
  static const String userNameKey = 'userNameKey';

  // set user name
  static Future<void> setUserName(String name) async {
    await _prefs!.setString(userNameKey, name);
  }

  // get user name
  static String getUserName() {
    return _prefs!.getString(userNameKey) ?? '';
  }

  // user email key
  static const String userEmailKey = 'userEmailKey';

  // set user email
  static Future<void> setUserEmail(String email) async {
    await _prefs!.setString(userEmailKey, email);
  }

  // get user email
  static String getUserEmail() {
    return _prefs!.getString(userEmailKey) ?? '';
  }

  // user role key
  static const String userRoleKey = 'userRole';

  // set user role
  static Future<void> setUserRole(String role) async {
    await _prefs!.setString(userRoleKey, role);
  }

  // get user role
  static String getUserRole() {
    return _prefs!.getString(userRoleKey) ?? '';
  }

  // active account index key
  static const String activeAccountIndexKey = 'activeAccountIndexKey';

  // set active account index
  static Future<void> setActiveAccountIndex(int index) async {
    await _prefs!.setInt(activeAccountIndexKey, index);
  }

  // get active account index
  static int getActiveAccountIndex() {
    return _prefs!.getInt(activeAccountIndexKey) ?? 0;
  }

  // user phone number key
  static const String userPhoneNumberKey = 'userPhoneNumberKey';

  // set user phone number
  static Future<void> setUserPhoneNumber(String phoneNumber) async {
    await _prefs!.setString(userPhoneNumberKey, phoneNumber);
  }

  // get user phone number
  static String getUserPhoneNumber() {
    return _prefs!.getString(userPhoneNumberKey) ?? '';
  }

  // user address kay
  static const String userAddressKey = 'userAddressKey';

  // set user address
  static Future<void> setUserAddress(String address) async {
    await _prefs!.setString(userAddressKey, address);
  }

  // get user address
  static String getUserAddress() {
    return _prefs!.getString(userAddressKey) ?? '';
  }

  // save user data
  static Future<void> saveUserData({required UserModel user}) async {
    await setIsUserLoggedIn();
    await setUserId(user.id);
    await setUserName(user.name);
    await setUserAddress(user.address);
    await setUserEmail(user.activeAccount.email);
    await setUserRole(user.activeAccount.role);
    await setUserPhoneNumber(user.activeAccount.phone);
  }

  // email verified key
  static const String emailVerifiedKey = 'emailVerifiedKey';

  // set email verified
  static Future<void> setEmailVerified() async {
    await _prefs!.setBool(emailVerifiedKey, true);
  }

  // get email verified
  static bool getEmailVerified() {
    return _prefs!.getBool(emailVerifiedKey) ?? false;
  }
}
