import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/models/account_model.dart';
import 'package:souq/core/models/user_model.dart';

class RoleSelectionRepo {
  final FirebaseFirestore firestore;

  RoleSelectionRepo({required this.firestore});

  Future<void> setRole(String role) async {
    final id = SharedPref.getUserId();

    final userRef = firestore.collection('users').doc(id);

    final doc = await userRef.get();

    final user = UserModel.fromJson(doc.data()!);

    final account = user.accounts[user.activeAccountIndex];

    final updatedAccount = AccountModel(
      email: account.email,
      phone: account.phone,
      role: role,
    );

    await userRef.update({
      'accounts.${user.activeAccountIndex}': updatedAccount.toJson(),
    });

    await SharedPref.setUserRole(role);
  }
}
