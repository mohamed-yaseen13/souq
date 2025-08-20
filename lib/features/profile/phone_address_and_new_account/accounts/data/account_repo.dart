import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/database/database.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/models/account_model.dart';

class AccountRepo {
  final FirebaseAuth auth;

  AccountRepo({required this.auth});

  Future<List<AccountModel>> getUserAccounts() async {
    final userId = SharedPref.getUserId();

    final map = await Database.getUserAccountsMap(userId);

    final keys = map.keys.toList()..sort();
    return [for (final k in keys) map[k]!];
  }

  Future<void> switchAccount(String email) async {
    await auth.signOut();

    await SharedPref.clear();

    final String password = await Database.getPasswordFromDatabase(email);

    await auth.signInWithEmailAndPassword(email: email, password: password);

    await Database.getUserFromDatabaseToSaveAtSharedPrefs(email);
  }
}
