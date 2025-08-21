import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/database/database.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/services/generator.dart';
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
    final bool isOtpCorrect = await Database.isOtpCorrect(email, otp);
    if (!isOtpCorrect) {
      throw Exception('Invalid OTP');
    }

    final password = Generator.generatePassword();

    // --- Create user with raw password ---
    final userRec = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await Database.savePasswordToDatabase(email, password);

    final name = SharedPref.getUserName();

    await Database.addNewAccount(
      email: email,
      uid: userRec.user!.uid,
      name: name,
    );

    await Database.deleteOtp(email);
  }
}
