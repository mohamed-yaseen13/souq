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
    required String providerMethod,
  }) async {
    final index = SharedPref.getActiveAccountIndex();

    final userRef = getUserRef(id);

    final userDoc = await userRef.get();

    late UserModel user;

    if (!userDoc.exists) {
      user = UserModel(
        id: id,
        name: name,
        accounts: {
          '0': AccountModel(email: email, providerMethod: [providerMethod]),
        },
      );

      await userRef.set(user.toJson());

      await userRef.update({
        'createdAt': FieldValue.serverTimestamp(),
        'accounts.${index.toString()}.createdAt': FieldValue.serverTimestamp(),
      });

      await getEmailRef(email.toLowerCase()).set({
        'providerMethods': [providerMethod],
        'createdAt': FieldValue.serverTimestamp(),
      });
    } else {
      user = UserModel.fromJson(userDoc.data()!);
    }
    await SharedPref.saveUserData(user: user);
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
        .doc(email.toLowerCase())
        .get();
    return doc.exists;
  }

  static Future<bool> checkIfEmailExistWithPasswordProvider(
    String email,
  ) async {
    final doc = await FirebaseFirestore.instance
        .collection(AppConstants.emailsCollections)
        .doc(email.toLowerCase())
        .get();
    if (doc.exists) {
      final data = doc.data();

      final List<dynamic> providers = data!['providerMethods'];

      return providers.contains('emailAndPassword');
    }
    return false;
  }

  static Future<bool> checkIfEmailExistWithGoogleProvider(String email) async {
    final doc = await FirebaseFirestore.instance
        .collection(AppConstants.emailsCollections)
        .doc(email.toLowerCase())
        .get();
    if (doc.exists) {
      final data = doc.data();

      final List<dynamic> providers = data!['providerMethods'];

      return providers.contains('google');
    }
    return false;
  }

  static Future<void> setUserImage() async {
    final id = SharedPref.getUserId();
    await getUserRef(id).update({'imageUrl': 'exist'});
    await SharedPref.setUserImage(true);
  }

  static Future<void> changeUserName(String name) async {
    final id = SharedPref.getUserId();
    await getUserRef(id).update({'name': name});
    await SharedPref.setUserName(name);
  }

  static Future<void> deleteUserImage() async {
    final id = SharedPref.getUserId();
    await getUserRef(id).update({'imageUrl': ''});
    await SharedPref.setUserImage(false);
  }

  //static Future<void> addNewAccount(String email) async {
  //  final id = SharedPref.getUserId();
  //  final userRef = getUserRef(id);
  //}

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
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encryptedPassword = encrypter.encrypt(password, iv: iv).base64;

    await getPasswordsRef(email).set({'password': encryptedPassword});
  }
}
