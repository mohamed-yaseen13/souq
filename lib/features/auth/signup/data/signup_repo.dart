import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/core/auth/auth_service.dart';
import 'package:souq/core/helpers/google_credential.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/models/account_model.dart';
import 'package:souq/core/models/user_model.dart';
import 'package:souq/features/auth/signup/data/signup_request_model.dart';

class SignupRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  SignupRepo({required this.auth, required this.firestore});

  Future<void> signupWithEmail(SignupRequestModel request) async {
    final bool emailExist = await AuthService.checkIfEmailExist(request.email);

    if (emailExist) {
      throw Exception("Email Already Exist Try Login");
    }

    final userCred = await auth.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    final user = UserModel(
      id: userCred.user!.uid,
      name: request.name,
      accounts: {'0': AccountModel(email: request.email, phone: '', role: '')},
    );

    await firestore.collection('users').doc(user.id).set(user.toJson());

    await SharedPref.saveUserData(user: user);
  }

  Future<void> signupWithGoogle() async {
    final credential = await GoogleCredential.getGoogleCredential();

    final userCred = await auth.signInWithCredential(credential);

    final userDoc = await firestore
        .collection('users')
        .doc(userCred.user!.uid)
        .get();

    if (!userDoc.exists) {
      final user = UserModel(
        id: userCred.user!.uid,
        name: userCred.user!.displayName!,
        accounts: {
          '0': AccountModel(email: userCred.user!.email!, phone: '', role: ''),
        },
      );

      await firestore
          .collection('users')
          .doc(userCred.user!.uid)
          .set(user.toJson());

      await SharedPref.saveUserData(user: user);
    } else {
      final user = UserModel.fromJson(userDoc.data()!);
      await SharedPref.saveUserData(user: user);
    }
  }
}
