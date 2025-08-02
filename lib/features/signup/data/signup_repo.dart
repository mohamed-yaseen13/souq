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

    final id = userCred.user?.uid;
    if (id == null) throw Exception('Failed to get user ID');

    final user = UserModel(
      id: id,
      name: request.name,
      email: request.email,
      phone: '',
      role: request.role,
    );

    await firestore.collection('users').doc(request.email).set(user.toJson());
  }

  Future<void> signupWithGoogle() async {
    final credential = await GoogleCredential.getGoogleCredential();

    final userCred = await auth.signInWithCredential(credential);

    final id = userCred.user?.uid;
    if (id == null) throw Exception('Failed to get user ID');

    final userDoc = await firestore.collection('users').doc(id).get();
    if (!userDoc.exists) {
      final user = UserModel(
        id: id,
        name: userCred.user?.displayName ?? '',
        email: userCred.user?.email ?? '',
        phone: '',
        role: '',
      );
      await firestore.collection('users').doc(id).set(user.toJson());
    }
  }
}
