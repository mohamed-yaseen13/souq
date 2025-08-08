import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/auth/auth_service.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/features/login/data/login_request_model.dart';

class LoginRepo {
  final FirebaseAuth auth;

  LoginRepo({required this.auth});

  Future<void> loginWithEmail(LoginRequestModel request) async {
    final bool emailExist = await AuthService.checkIfEmailExist(request.email);

    if (!emailExist) {
      throw Exception("Email Doesn't Exist");
    }

    try {
      final userCred = await auth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      await SharedPref.saveUser(userCred.user!.uid);
    } on FirebaseAuthException {
      throw Exception('Incorrect Password');
    }
  }
}
