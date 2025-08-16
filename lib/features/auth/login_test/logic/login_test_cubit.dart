import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/login_test/data/login_test_repo.dart';

class LoginTestState {
  final bool loading;
  final String? error;
  final bool otpSent;
  final bool loggedIn;
  final String? email;

  LoginTestState({
    this.loading = false,
    this.error,
    this.otpSent = false,
    this.loggedIn = false,
    this.email,
  });

  LoginTestState copyWith({
    bool? loading,
    String? error,
    bool? otpSent,
    bool? loggedIn,
    String? email,
  }) {
    return LoginTestState(
      loading: loading ?? this.loading,
      error: error,
      otpSent: otpSent ?? this.otpSent,
      loggedIn: loggedIn ?? this.loggedIn,
      email: email ?? this.email,
    );
  }
}

class LoginTestCubit extends Cubit<LoginTestState> {
  final LoginTestRepo repo;
  LoginTestCubit(this.repo) : super(LoginTestState());

  Future<void> sendOtp(String email) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      await repo.sendEmailOtp(email);
      emit(state.copyWith(loading: false, otpSent: true, email: email));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  Future<void> verifyOtp(String otp, String email) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      await repo.verifyEmailOtpThenLogin(email, otp);
      emit(state.copyWith(loading: false, loggedIn: true));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
