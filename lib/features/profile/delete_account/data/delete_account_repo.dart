import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/database/database.dart';
import 'package:souq/core/helpers/shared_pref.dart';

class DeleteAccountRepo {
  final FirebaseAuth auth;

  DeleteAccountRepo({required this.auth});

  Future<void> deleteAccount() async {
    final email = SharedPref.getUserEmail();

    final password = await Database.getPasswordFromDatabase(email);

    await auth.signInWithEmailAndPassword(email: email, password: password);

    await auth.currentUser!.delete();

    await Database.deleteAccount();

    await SharedPref.clear();
  }
}
