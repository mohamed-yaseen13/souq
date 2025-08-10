import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/database/database.dart';
import 'package:souq/core/helpers/google_credential.dart';
import 'package:souq/features/auth/signup/data/signup_request_model.dart';

class SignupRepo {
  final FirebaseAuth auth;

  SignupRepo({required this.auth});

  Future<void> signupWithEmail(SignupRequestModel request) async {
    final bool emailExist = await Database.checkIfEmailExist(request.email);

    if (emailExist) {
      throw Exception("Email Already Exist Try Login");
    }

    final userCred = await auth.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    print(
      'Providers: ${userCred.user!.providerData.map((p) => p.providerId).join(', ')}',
    );

    await Database.setUserToDatabase(
      userCred.user!.uid,
      request.name,
      request.email,
    );
  }

  Future<void> signupWithGoogle() async {
    final credential = await GoogleCredential.getGoogleCredential();

    final userCred = await auth.signInWithCredential(credential);

    print(
      'Providers: ${userCred.user!.providerData.map((p) => p.providerId).join(', ')}',
    );

    await Database.setUserToDatabase(
      userCred.user!.uid,
      userCred.user!.displayName ?? '',
      userCred.user!.email!,
    );
  }
}
