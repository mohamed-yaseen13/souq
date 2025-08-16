import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:souq/core/database/database.dart';

class LoginTestRepo {
  final auth = FirebaseAuth.instance;

  Future<void> sendEmailOtp(String email) async {
    final bool emailExist = await Database.checkIfEmailExist(email);

    if (!emailExist) {
      throw Exception("Email Doesn't Exist");
    }

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

  Future<void> verifyEmailOtpThenLogin(String email, String otp) async {
    final bool isOtpCorrect = await Database.isOtpCorrect(email, otp);
    if (!isOtpCorrect) {
      throw Exception('Invalid OTP');
    }

    final password = await Database.getPasswordFromDatabase(email);

    final userCred = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    await Database.getUserFromDatabaseToSaveAtSharedPrefs(userCred.user!.uid);

    await Database.deleteOtp(email);
  }
}
