import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/models/user_model.dart';
import 'package:souq/features/signup/data/signup_request_model.dart';

class SignupRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  SignupRepo({required this.auth, required this.firestore});

  Future<void> signupWithEmail(SignupRequestModel request) async {
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
      phone: "", // or remove this field if not used
      role: request.role,
    );

    await firestore.collection('users').doc(id).set(user.toJson());
  }
}
