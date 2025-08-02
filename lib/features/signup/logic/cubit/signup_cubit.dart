import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/signup/data/signup_repo.dart';
import 'package:souq/features/signup/data/signup_request_model.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;

  SignupCubit(this.signupRepo) : super(const SignupState.initial());

  void signupWithEmail(SignupRequestModel request) async {
    emit(const SignupState.loading());

    try {
      await signupRepo.signupWithEmail(request);
      emit(SignupState.success());
    } catch (e) {
      emit(SignupState.error(e.toString()));
    }
  }

  void signupWithGoogle() async {
    emit(const SignupState.loading());

    try {
      await signupRepo.signupWithGoogle();
      emit(SignupState.success());
    } catch (e) {
      emit(SignupState.error(e.toString()));
    }
  }
}
