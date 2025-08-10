import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/database/database.dart';
import 'package:souq/features/auth/reset_password/data/reset_password_request_model.dart';

class ResetPasswordRepo {
  final FirebaseAuth auth;

  ResetPasswordRepo({required this.auth});

  Future<void> sendResetPasswordLink(ResetPasswordRequestModel request) async {
    final bool emailExist = await Database.checkIfEmailExist(request.email);

    if (!emailExist) {
      throw Exception("Email Doesn't Exist");
    }
    await auth.sendPasswordResetEmail(email: request.email);
  }
}
