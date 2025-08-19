import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/signup/data/signup_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;

  SignupCubit(this.signupRepo) : super(const SignupState.initial());

  void sendOtp(String email) async {
    emit(const SignupState.sendingOtp());
    try {
      await signupRepo.sendEmailOtp(email);
      emit(SignupState.otpSent(email: email));
    } catch (e) {
      emit(SignupState.error(e.toString()));
    }
  }

  void verifyOtpThenSignup({required String email, required String otp}) async {
    emit(SignupState.verifyingOtp(email: email));
    try {
      await signupRepo.verifyOtpThenSignup(email, otp);
      emit(SignupState.signedUp(email: email));
    } catch (e) {
      emit(SignupState.error(e.toString()));
    }
  }
}
