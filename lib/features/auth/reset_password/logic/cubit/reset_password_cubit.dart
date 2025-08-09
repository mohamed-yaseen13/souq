import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/reset_password/data/reset_password_repo.dart';
import 'package:souq/features/auth/reset_password/data/reset_password_request_model.dart';
import 'package:souq/features/auth/reset_password/logic/cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo resetPasswordRepo;

  ResetPasswordCubit(this.resetPasswordRepo)
    : super(ResetPasswordState.initial());

  void sendResetPasswordEmail(ResetPasswordRequestModel request) async {
    emit(const ResetPasswordState.loading());

    try {
      await resetPasswordRepo.sendResetPasswordLink(request);

      emit(ResetPasswordState.success());
    } catch (e) {
      emit(ResetPasswordState.error(e.toString()));
    }
  }
}
