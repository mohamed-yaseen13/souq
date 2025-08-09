import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/auth/auth_service.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/models/user_model.dart';
import 'package:souq/features/auth/login/data/login_request_model.dart';

class LoginRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  LoginRepo({required this.auth, required this.firestore});

  Future<void> loginWithEmail(LoginRequestModel request) async {
    final bool emailExist = await AuthService.checkIfEmailExist(request.email);

    if (!emailExist) {
      throw Exception("Email Doesn't Exist");
    }

    try {
      final userCred = await auth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      final doc = await firestore
          .collection('users')
          .doc(userCred.user!.uid)
          .get();

      final user = UserModel.fromJson(doc.data()!);

      await SharedPref.saveUserData(user: user);
    } on FirebaseAuthException {
      throw Exception('Incorrect Password');
    }
  }
}
