import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/login/data/login_repo.dart';
import 'package:souq/features/auth/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginState.initial());

  void sendOtp(String email) async {
    emit(const LoginState.sendingOtp());

    try {
      await loginRepo.sendEmailOtp(email);
      emit(LoginState.otpSent(email: email));
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }

  void verifyOtpThenLogin({required String email, required String otp}) async {
    emit(LoginState.verifyingOtp(email: email));

    try {
      await loginRepo.verifyOtpThenLogin(email, otp);
      emit(LoginState.loggedIn(email: email));
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }
}
