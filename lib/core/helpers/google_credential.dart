import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleCredential {
  static Future<OAuthCredential> getGoogleCredential() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(
      serverClientId:
          '851059657252-kbe0ac3gvgsk88er2l49jg9oqs351qui.apps.googleusercontent.com',
    );

    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return credential;
  }

  static String getEmailFromGoogleCredential(OAuthCredential credential) {
    final parts = credential.idToken!.split('.');
    String payload = parts[1];
    switch (payload.length % 4) {
      case 0:
        break;
      case 2:
        payload += '==';
        break;
      case 3:
        payload += '=';
        break;
      default:
        throw Exception('Invalid base64 string');
    }
    final decodedBytes = base64Decode(payload);
    final decodedString = utf8.decode(decodedBytes);
    final payloadJson = jsonDecode(decodedString);

    return payloadJson['email'] as String;
  }
}
