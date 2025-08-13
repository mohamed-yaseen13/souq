import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq/features/profile/phone_address_and_new_account/phone/data/phone_request_model.dart';

class PhoneRepo {
  final FirebaseAuth auth;

  PhoneRepo({required this.auth});

  Future<void> verifyPhoneNumber(PhoneRequestModel request) async {
    await auth.verifyPhoneNumber(
      phoneNumber: request.phoneNumber,
      timeout: const Duration(minutes: 2),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        print("Code sent to ${request.phoneNumber}");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Auto retrieval timeout for verificationId: $verificationId");
      },
    );
  }
}
