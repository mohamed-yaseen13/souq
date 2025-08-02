import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/auth/auth_service.dart';
import 'package:souq/features/reset_password/data/reset_password_request_model.dart';

class ResetPasswordRepo {
  final FirebaseAuth auth;

  ResetPasswordRepo({required this.auth});

  Future<void> sendResetPasswordLink(ResetPasswordRequestModel request) async {
    final bool emailExist = await AuthService.checkIfEmailExist(request.email);

    if (!emailExist) {
      throw Exception("Email Doesn't Exist");
    }
    await auth.sendPasswordResetEmail(email: request.email);
  }
}
