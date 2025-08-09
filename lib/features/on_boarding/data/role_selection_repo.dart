import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:souq/core/helpers/shared_pref.dart';

class RoleSelectionRepo {
  final FirebaseFirestore firestore;

  RoleSelectionRepo({required this.firestore});

  Future<void> setRole(String role) async {
    final id = SharedPref.getUserId();

    await firestore.collection('users').doc(id).update({'role': role});

    await SharedPref.setUserRole(role);
  }
}
