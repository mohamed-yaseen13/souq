import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/auth/auth_service.dart';
import 'package:souq/core/helpers/google_credential.dart';
import 'package:souq/core/models/user_model.dart';
import 'package:souq/features/signup/data/signup_request_model.dart';

class SignupRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  SignupRepo({required this.auth, required this.firestore});

  Future<void> signupWithEmail(SignupRequestModel request) async {
    final bool emailExist = await AuthService.checkIfEmailExist(request.email);

    if (emailExist) {
      throw Exception("Email Already Exist");
    }

    final userCred = await auth.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    final user = UserModel(
      id: userCred.user!.uid,
      name: request.name,
      email: request.email,
      phone: '',
      role: '',
    );

    await firestore.collection('users').doc(request.email).set(user.toJson());
  }

  Future<void> signupWithGoogle() async {
    final credential = await GoogleCredential.getGoogleCredential();

    final userCred = await auth.signInWithCredential(credential);

    final userDoc = await firestore
        .collection('users')
        .doc(userCred.user!.email)
        .get();

    if (!userDoc.exists) {
      final user = UserModel(
        id: userCred.user!.uid,
        name: userCred.user!.displayName!,
        email: userCred.user!.email!,
        phone: '',
        role: '',
      );

      await firestore
          .collection('users')
          .doc(userCred.user!.email)
          .set(user.toJson());
    }
  }
}
