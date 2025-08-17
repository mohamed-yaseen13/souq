import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/models/account_model.dart';
import 'package:souq/core/models/user_model.dart';

class Database {
  static DocumentReference<Map<String, dynamic>> getUserRef(String id) =>
      FirebaseFirestore.instance
          .collection(AppConstants.usersCollections)
          .doc(id);

  static DocumentReference<Map<String, dynamic>> getEmailRef(String email) =>
      FirebaseFirestore.instance
          .collection(AppConstants.emailsCollections)
          .doc(email);

  static DocumentReference<Map<String, dynamic>> getOtpRef(String email) =>
      FirebaseFirestore.instance
          .collection(AppConstants.otpCollections)
          .doc(email);

  static DocumentReference<Map<String, dynamic>> getPasswordsRef(
    String email,
  ) => FirebaseFirestore.instance
      .collection(AppConstants.passwordsCollection)
      .doc(email);

  static Future<void> setUserToDatabase({
    required String id,
    required String name,
    required String email,
  }) async {
    final userRef = getUserRef(id);

    final UserModel user = UserModel(
      id: id,
      name: name,
      accounts: {'0': AccountModel(email: email)},
    );

    await userRef.set(user.toJson());

    await userRef.update({
      'createdAt': FieldValue.serverTimestamp(),
      'accounts.0.createdAt': FieldValue.serverTimestamp(),
    });

    await SharedPref.saveUserData(user: user);

    await getEmailRef(email).set({'createdAt': FieldValue.serverTimestamp()});
  }

  static Future<void> getUserFromDatabaseToSaveAtSharedPrefs(String id) async {
    final userDoc = await getUserRef(id).get();
    final user = UserModel.fromJson(userDoc.data()!);
    await SharedPref.saveUserData(user: user);
  }

  static Future<void> updateUserRole(String role) async {
    final id = SharedPref.getUserId();
    final index = SharedPref.getActiveAccountIndex();
    await getUserRef(id).update({'accounts.${index.toString()}.role': role});
    await SharedPref.setUserRole(role);
  }

  static Future<bool> checkIfEmailExist(String email) async {
    final doc = await FirebaseFirestore.instance
        .collection(AppConstants.emailsCollections)
        .doc(email)
        .get();
    return doc.exists;
  }

  static Future<void> updateIsUserHasImage(bool value) async {
    final id = SharedPref.getUserId();
    await getUserRef(id).update({'isUserHasImage': value});
    await SharedPref.setUserImage(value);
  }

  static Future<void> changeUserName(String name) async {
    final id = SharedPref.getUserId();
    await getUserRef(id).update({'name': name});
    await SharedPref.setUserName(name);
  }

  static Future<void> addNewAccount(String email) async {
    final newAccount = AccountModel(email: email);

    final id = SharedPref.getUserId();
    final userRef = getUserRef(id);
    final userdoc = await userRef.get();

    final data = userdoc.data()!;

    final accounts = Map<String, dynamic>.from(data['accounts'] ?? {});
    final nextIndex = accounts.length.toString();

    await userRef.update({
      'accounts.$nextIndex': newAccount.toJson(),
      'accounts.$nextIndex.createdAt': FieldValue.serverTimestamp(),
      'activeAccountIndex': int.parse(nextIndex),
    });

    await SharedPref.setActiveAccountIndex(int.parse(nextIndex));
  }

  static Future<void> saveOtpToDatabase(String email, String otp) async {
    final expiresAt = DateTime.now().add(const Duration(minutes: 5));

    await getOtpRef(
      email,
    ).set({'otp': otp, "expiresAt": Timestamp.fromDate(expiresAt)});
  }

  static Future<bool> isOtpCorrect(String email, String otp) async {
    final doc = await getOtpRef(email).get();
    final String savedOtp = doc.data()!['otp'];
    final Timestamp expiresAtTs = doc.data()!['expiresAt'];
    final DateTime expiresAt = expiresAtTs.toDate();
    return savedOtp == otp && DateTime.now().isBefore(expiresAt);
  }

  static Future<void> savePasswordToDatabase(
    String email,
    String password,
  ) async {
    // --- Encrypt password before saving ---
    const String secretKey = "1234567890abcdef1234567890abcdef";
    final key = encrypt.Key.fromUtf8(secretKey);
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);

    await getPasswordsRef(email).set({
      'password': encrypted.base64,
      'iv': iv.base64, // save IV as well
    });
  }

  static Future<void> deleteOtp(String email) async {
    await getOtpRef(email).delete();
  }

  static Future<String> getPasswordFromDatabase(String email) async {
    final doc = await getPasswordsRef(email).get();

    final encryptedPassword = doc['password'] as String;
    final ivBase64 = doc['iv'] as String;

    // --- Decrypt password ---
    const String secretKey = "1234567890abcdef1234567890abcdef"; // same key
    final key = encrypt.Key.fromUtf8(secretKey);
    final iv = encrypt.IV.fromBase64(ivBase64);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    return encrypter.decrypt64(encryptedPassword, iv: iv);
  }
}
