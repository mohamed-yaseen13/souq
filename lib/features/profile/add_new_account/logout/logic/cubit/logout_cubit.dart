import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/profile/add_new_account/logout/data/logout_repo.dart';
import 'package:souq/features/profile/add_new_account/logout/logic/cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutRepo logoutRepo;

  LogoutCubit(this.logoutRepo) : super(LogoutState.initial());

  Future<void> logout() async {
    emit(const LogoutState.loading());

    try {
      await logoutRepo.logout();
      emit(LogoutState.success());
    } catch (e) {
      emit(LogoutState.error(e.toString()));
    }
  }
}
