import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:souq/core/database/database.dart';
import 'package:intl/intl.dart';
import 'package:souq/core/helpers/shared_pref.dart';

class SignupTestRepo {
  final auth = FirebaseAuth.instance;

  Future<void> sendEmailOtp(String email) async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

    final otp = (100000 + Random().nextInt(900000)).toString();

    final formattedTime = DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now());

    await http.post(
      url,
      headers: {
        'origin': 'http:/localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "service_id": "service_zbm0vb8",
        "template_id": "template_npctz7r",
        "user_id": "EvujsAAehpMxYQef_",
        "template_params": {
          "passcode": otp,
          "time": formattedTime,
          "to_email": email,
        },
      }),
    );

    await Database.saveOtpToDatabase(email, otp);
  }

  Future<void> verifyEmailOtp(String email, String otp) async {
    final bool emailExist = await Database.checkIfEmailExist(email);
    if (emailExist) {
      throw Exception("Email Already Exist Try Login");
    }

    final bool isOtpCorrect = await Database.isOtpCorrect(email, otp);
    if (!isOtpCorrect) {
      throw Exception('Invalid OTP');
    }

    // --- Generate password ---
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()';
    final rand = Random.secure();
    final password = List.generate(
      32,
      (_) => chars[rand.nextInt(chars.length)],
    ).join();

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
      providerMethod: 'email',
    );

    await Database.deleteOtp(email);
  }
}
