import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/database/database.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/services/password_generator.dart';
import 'package:souq/core/services/send_email_otp.dart';

class SignupRepo {
  final FirebaseAuth auth;

  SignupRepo({required this.auth});

  Future<void> sendEmailOtp(String email) async {
    final bool emailExist = await Database.checkIfEmailExist(email);

    if (emailExist) {
      throw Exception("Email Already Exist Try Login");
    }

    final otp = await SendEmailOtp.sendEmailOtp(email);

    await Database.saveOtpToDatabase(email, otp);
  }

  Future<void> verifyOtpThenSignup(String email, String otp) async {
    final bool isOtpCorrect = await Database.isOtpCorrect(email, otp);
    if (!isOtpCorrect) {
      throw Exception('Invalid OTP');
    }

    // --- Generate password ---
    final password = PasswordGenerator.generatePassword();

    // --- Create user with raw password ---
    final userRec = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await Database.savePasswordToDatabase(email, password);

    // --- Save user info ---
    final name = SharedPref.getUserName();
    await Database.setUserToDatabase(
      id: userRec.user!.uid,
      name: name,
      email: email,
    );

    await Database.deleteOtp(email);
  }
}
