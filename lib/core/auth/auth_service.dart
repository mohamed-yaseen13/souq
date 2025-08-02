import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  static Future<bool> checkIfEmailExist(String email) async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .get();

    if (!userDoc.exists) {
      return false;
    }
    return true;
  }
}
