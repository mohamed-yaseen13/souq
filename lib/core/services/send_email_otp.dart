import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class SendEmailOtp {
  static Future<String> sendEmailOtp(String email) async {
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

    return otp;
  }
}
