import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/helpers/shared_pref.dart';

class LogoutRepo {
  final FirebaseAuth auth;

  LogoutRepo({required this.auth});

  Future<void> logout() async {
    await auth.signOut();

    await SharedPref.clear();
  }
}
