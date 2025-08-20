import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/database/database.dart';
import 'package:souq/core/services/send_email_otp.dart';

class LoginRepo {
  final FirebaseAuth auth;

  LoginRepo({required this.auth});

  Future<void> sendEmailOtp(String email) async {
    final bool emailExist = await Database.checkIfEmailExist(email);

    if (!emailExist) {
      throw Exception("Email Doesn't Exist");
    }

    final otp = await SendEmailOtp.sendEmailOtp(email);

    await Database.saveOtpToDatabase(email, otp, isLogin: true);
  }

  Future<void> verifyOtpThenLogin(String email, String otp) async {
    final bool isOtpCorrect = await Database.isOtpCorrect(email, otp);
    if (!isOtpCorrect) {
      throw Exception('Invalid OTP');
    }

    final String password = await Database.getPasswordFromDatabase(email);

    await auth.signInWithEmailAndPassword(email: email, password: password);

    await Database.getUserFromDatabaseToSaveAtSharedPrefs(email);

    await Database.deleteOtp(email);
  }
}
