import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/features/login/data/login_request_model.dart';

class LoginRepo {
  final FirebaseAuth auth;

  LoginRepo({required this.auth});

  Future<void> loginWithEmail(LoginRequestModel request) async {
    final userCred = await auth.signInWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    final id = userCred.user?.uid;
    if (id == null) throw Exception('Failed to get user ID');
  }
}
