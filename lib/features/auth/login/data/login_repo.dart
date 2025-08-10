import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/database/database.dart';
import 'package:souq/features/auth/login/data/login_request_model.dart';

class LoginRepo {
  final FirebaseAuth auth;

  LoginRepo({required this.auth});

  Future<void> loginWithEmail(LoginRequestModel request) async {
    final bool emailExist = await Database.checkIfEmailExist(request.email);

    if (!emailExist) {
      throw Exception("Email Doesn't Exist");
    }

    final bool emailExistWithGoogleProvider =
        await Database.checkIfEmailExistWithGoogleProvider(request.email);

    if (emailExistWithGoogleProvider) {
      throw Exception('Try Login With Google Account');
    }

    try {
      final userCred = await auth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      await Database.getUserFromDatabaseToSaveAtSharedPrefs(userCred.user!.uid);
    } on FirebaseAuthException {
      throw Exception('Incorrect Password');
    }
  }
}
