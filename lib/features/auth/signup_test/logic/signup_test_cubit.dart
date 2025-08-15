import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/signup_test/data/signup_test_repo.dart';

class SignupTestState {
  final bool loading;
  final String? error;
  final bool otpSent;
  final bool signedIn;
  final String? email;

  SignupTestState({
    this.loading = false,
    this.error,
    this.otpSent = false,
    this.signedIn = false,
    this.email,
  });

  SignupTestState copyWith({
    bool? loading,
    String? error,
    bool? otpSent,
    bool? signedIn,
    String? email,
  }) {
    return SignupTestState(
      loading: loading ?? this.loading,
      error: error,
      otpSent: otpSent ?? this.otpSent,
      signedIn: signedIn ?? this.signedIn,
      email: email ?? this.email,
    );
  }
}

class SignupTestCubit extends Cubit<SignupTestState> {
  final SignupTestRepo repo;
  SignupTestCubit(this.repo) : super(SignupTestState());

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
      await repo.verifyEmailOtp(email, otp);
      emit(state.copyWith(loading: false, signedIn: true));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
