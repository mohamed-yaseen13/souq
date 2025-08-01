import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/login/data/login_repo.dart';
import 'package:souq/features/login/data/login_request_model.dart';
import 'package:souq/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginState.initial());

  void loginWithEmail(LoginRequestModel request) async {
    emit(const LoginState.loading());

    try {
      await loginRepo.loginWithEmail(request);
      emit(LoginState.success());
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }
}
