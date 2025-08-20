import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/models/account_model.dart';
import 'package:souq/core/models/user_model.dart';

class Database {
  static DocumentReference<Map<String, dynamic>> getUserRef(
    String generatedUserId,
  ) => FirebaseFirestore.instance
      .collection(AppConstants.usersCollections)
      .doc(generatedUserId);

  static DocumentReference<Map<String, dynamic>> getEmailRef(String email) =>
      FirebaseFirestore.instance
          .collection(AppConstants.emailsCollections)
          .doc(email);

  static Future<bool> checkIfEmailExist(String email) async {
    final doc = await getEmailRef(email).get();
    return doc.exists;
  }

  static Future<void> saveOtpToDatabase(
    String email,
    String otp, {
    bool isLogin = false,
  }) async {
    final expiresAt = DateTime.now().add(const Duration(minutes: 5));

    if (isLogin) {
      await getEmailRef(
        email,
      ).update({'otp': otp, "expiresAt": Timestamp.fromDate(expiresAt)});
      return;
    }

    await getEmailRef(
      email,
    ).set({'otp': otp, "expiresAt": Timestamp.fromDate(expiresAt)});
  }

  static Future<bool> isOtpCorrect(String email, String otp) async {
    final doc = await getEmailRef(email).get();
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

    await getEmailRef(email).update({
      'password': encrypted.base64,
      'iv': iv.base64, // save IV as well
    });
  }

  static Future<void> setUserToDatabase({
    required String generatedUserId,
    required String uid,
    required String name,
    required String email,
  }) async {
    final userRef = getUserRef(generatedUserId);

    final UserModel user = UserModel(
      accounts: {'0': AccountModel(email: email, uid: uid, name: name)},
    );

    await userRef.set(user.toJson());

    await userRef.update({
      'accounts.0.createdAt': FieldValue.serverTimestamp(),
    });

    await SharedPref.saveUserData(user: user, generatedUserId: generatedUserId);

    await getEmailRef(
      email,
    ).update({'userId': generatedUserId, 'accountIndex': '0'});
  }

  static Future<void> deleteOtp(String email) async {
    await getEmailRef(
      email,
    ).update({'otp': FieldValue.delete(), 'expiresAt': FieldValue.delete()});
  }

  static Future<void> updateUserRole(String role) async {
    final id = SharedPref.getUserId();
    final index = SharedPref.getActiveAccountIndex();
    await getUserRef(id).update({'accounts.${index.toString()}.role': role});
    await SharedPref.setUserRole(role);
  }

  static Future<void> updateIsAccountHasImage(bool value) async {
    final id = SharedPref.getUserId();
    final index = SharedPref.getActiveAccountIndex();
    final accountImageNumber = SharedPref.getAccountImageNumber();
    await getUserRef(id).update({
      'accounts.${index.toString()}.isAccountHasImage': value,
      'accounts.${index.toString()}.accountImageNumber': accountImageNumber,
    });
    await SharedPref.setUserImage(value);
  }

  static Future<void> changeAccountName(String name) async {
    final id = SharedPref.getUserId();
    final index = SharedPref.getActiveAccountIndex();
    await getUserRef(id).update({'accounts.${index.toString()}.name': name});
    await SharedPref.setUserName(name);
  }

  static Future<void> addNewAccount({
    required String email,
    required String uid,
    required String name,
  }) async {
    final id = SharedPref.getUserId();
    final userRef = getUserRef(id);
    final userdoc = await userRef.get();
    final data = userdoc.data()!;
    final accounts = Map<String, dynamic>.from(data['accounts'] ?? {});
    final nextIndex = accounts.length.toString();
    final newAccount = AccountModel(email: email, uid: uid, name: name);

    await userRef.update({
      'accounts.$nextIndex': newAccount.toJson(),
      'accounts.$nextIndex.createdAt': FieldValue.serverTimestamp(),
      'activeAccountIndex': int.parse(nextIndex),
    });

    await SharedPref.setActiveAccountIndex(int.parse(nextIndex));

    final updatedUserdoc = await userRef.get();
    final updatedUser = UserModel.fromJson(updatedUserdoc.data()!);
    await SharedPref.saveUserData(user: updatedUser, generatedUserId: id);

    await getEmailRef(email).update({'userId': id, 'accountIndex': nextIndex});
  }

  static Future<String> getPasswordFromDatabase(String email) async {
    final doc = await getEmailRef(email).get();

    final encryptedPassword = doc['password'] as String;
    final ivBase64 = doc['iv'] as String;

    // --- Decrypt password ---
    const String secretKey = "1234567890abcdef1234567890abcdef"; // same key
    final key = encrypt.Key.fromUtf8(secretKey);
    final iv = encrypt.IV.fromBase64(ivBase64);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    return encrypter.decrypt64(encryptedPassword, iv: iv);
  }

  static Future<void> getUserFromDatabaseToSaveAtSharedPrefs(
    String email,
  ) async {
    final emailDoc = await getEmailRef(email).get();
    final generatedUserId = emailDoc['userId'] as String;
    final accountIndex = emailDoc['accountIndex'] as String;

    final userRef = getUserRef(generatedUserId);

    await userRef.update({'activeAccountIndex': int.parse(accountIndex)});

    final userDoc = await userRef.get();

    final user = UserModel.fromJson(userDoc.data()!);
    await SharedPref.saveUserData(user: user, generatedUserId: generatedUserId);
  }

  static Future<Map<int, AccountModel>> getUserAccountsMap(
    String userId,
  ) async {
    final snap = await Database.getUserRef(userId).get();
    final data = snap.data();

    final raw = Map<String, dynamic>.from(data?['accounts'] ?? {});

    final result = <int, AccountModel>{};
    for (final entry in raw.entries) {
      final key = int.tryParse(entry.key);
      if (key == null) continue;

      final valueMap = Map<String, dynamic>.from(entry.value as Map);
      result[key] = AccountModel.fromJson(valueMap);
    }
    return result;
  }

  static Future<void> deleteAccount() async {
    final String userId = SharedPref.getUserId();
    final String accountId = SharedPref.getAccountId();

    final userRef = getUserRef(userId);

    final userDoc = await userRef.get();

    final userData = userDoc.data()!;

    final accountsMap = Map<String, dynamic>.from(userData['accounts'] ?? {});
    final userAccounts = accountsMap.values
        .map((e) => Map<String, dynamic>.from(e))
        .toList();

    if (userAccounts.length == 1) {
      await userRef.delete();
    } else {
      final updatedAccounts = userAccounts
          .where((acc) => acc['uid'] != accountId)
          .toList();

      final updatedAccountsMap = {
        for (int i = 0; i < updatedAccounts.length; i++)
          i.toString(): updatedAccounts[i],
      };

      await userRef.update({'accounts': updatedAccountsMap});
    }

    final email = SharedPref.getUserEmail();

    await getEmailRef(email).delete();
  }
}
