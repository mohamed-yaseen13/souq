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

    await Database.setUserToDatabase(
      id: userCred.user!.uid,
      name: request.name,
      email: request.email,
      providerMethod: 'emailAndPassword',
    );
  }

  Future<void> signupWithGoogle() async {
    final credential = await GoogleCredential.getGoogleCredential();

    final email = GoogleCredential.getEmailFromGoogleCredential(credential);

    final bool emailExistsWithPassword =
        await Database.checkIfEmailExistWithPasswordProvider(email);

    if (emailExistsWithPassword) {
      throw Exception(
        "This email is already registered with email and password. Please Log in using your email and password instead.",
      );
    }

    final userCred = await auth.signInWithCredential(credential);

    await Database.setUserToDatabase(
      id: userCred.user!.uid,
      name: userCred.user!.displayName ?? '',
      email: userCred.user!.email!,
      providerMethod: 'google',
    );
  }
}
