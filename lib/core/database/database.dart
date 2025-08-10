import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/models/account_model.dart';
import 'package:souq/core/models/user_model.dart';

class Database {
  static DocumentReference<Map<String, dynamic>> getUserRef(String id) =>
      FirebaseFirestore.instance
          .collection(AppConstants.usersCollections)
          .doc(id);

  static Future<void> setUserToDatabase(
    String id,
    String name,
    String email,
  ) async {
    final index = SharedPref.getActiveAccountIndex();

    final userRef = getUserRef(id);

    final userDoc = await userRef.get();

    late UserModel user;

    if (!userDoc.exists) {
      user = UserModel(
        id: id,
        name: name,
        accounts: {'0': AccountModel(email: email)},
      );

      await userRef.set(user.toJson());

      await userRef.update({
        'createdAt': FieldValue.serverTimestamp(),
        'accounts.${index.toString()}.createdAt': FieldValue.serverTimestamp(),
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
    final index = SharedPref.getActiveAccountIndex();

    final snapshot = await FirebaseFirestore.instance
        .collection(AppConstants.usersCollections)
        .where('accounts.${index.toString()}.email', isEqualTo: email)
        .limit(1)
        .get();
    return snapshot.docs.isNotEmpty;
  }
}
