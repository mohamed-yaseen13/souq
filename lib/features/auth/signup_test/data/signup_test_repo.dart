import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:souq/core/database/database.dart';
import 'package:intl/intl.dart';

class SignupTestRepo {
  final auth = FirebaseAuth.instance;
  final secureStorage = const FlutterSecureStorage();

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
    final bool isOtpCorrect = await Database.isOtpCorrect(email, otp);

    if (!isOtpCorrect) {
      throw Exception('Invalid OTP');
    }

    String? savedPassword = await secureStorage.read(key: 'pwd_$email');

    if (savedPassword == null) {
      // ---- SIGNUP ----
      // Generate random password
      const chars =
          'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()';
      final rand = Random.secure();
      final password = List.generate(
        32,
        (_) => chars[rand.nextInt(chars.length)],
      ).join();

      // Create user with that password
      final userRec = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store password securely
      await secureStorage.write(key: 'pwd_$email', value: password);

      print("Signed up new user: ${userRec.user?.uid}");
    } else {
      // ---- LOGIN ----
      final userRec = await auth.signInWithEmailAndPassword(
        email: email,
        password: savedPassword,
      );

      print("Logged in user: ${userRec.user?.uid}");
    }
  }
}
