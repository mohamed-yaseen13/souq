import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/database/database.dart';
import 'package:souq/core/services/send_email_otp.dart';

class AddAccountRepo {
  final FirebaseAuth auth;

  AddAccountRepo({required this.auth});

  Future<void> sendEmailOtp(String email) async {
    final bool emailExist = await Database.checkIfEmailExist(email);

    if (emailExist) {
      throw Exception("Email Already Exist Try Login");
    }

    final otp = await SendEmailOtp.sendEmailOtp(email);
    await Database.saveOtpToDatabase(email, otp);
  }

  Future<void> verifyOtpThenAddAccount(String email, String otp) async {
    final bool emailExist = await Database.checkIfEmailExist(email);

    if (emailExist) {
      throw Exception("Email Already Exist Try Login");
    }

    final bool isOtpCorrect = await Database.isOtpCorrect(email, otp);
    if (!isOtpCorrect) {
      throw Exception('Invalid OTP');
    }

    await Database.addNewAccount(email);

    // link that email with the first one to allow users to log in directly to
    // the new account to their rec at firebase authentication

    await Database.deleteOtp(email);
  }
}
