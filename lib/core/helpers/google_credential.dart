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
}
