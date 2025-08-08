import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  static Future<bool> checkIfEmailExist(String email) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    return snapshot.docs.isNotEmpty;
  }
}
