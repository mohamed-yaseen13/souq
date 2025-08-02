import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/features/reset_password/data/reset_password_request_model.dart';

class ResetPasswordRepo {
  final FirebaseAuth auth;

  ResetPasswordRepo({required this.auth});

  Future<void> sendResetPasswordLink(ResetPasswordRequestModel request) async {
    try {
      await auth.sendPasswordResetEmail(email: request.email);
    } catch (e) {
      print(e.toString());
    }
  }
}
