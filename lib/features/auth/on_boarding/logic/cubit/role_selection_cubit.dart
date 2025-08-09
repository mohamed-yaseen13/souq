import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/auth/on_boarding/data/role_selection_repo.dart';
import 'package:souq/features/auth/on_boarding/logic/cubit/role_selection_state.dart';

class RoleSelectionCubit extends Cubit<RoleSelectionState> {
  final RoleSelectionRepo roleSelectionRepo;

  RoleSelectionCubit(this.roleSelectionRepo)
    : super(RoleSelectionState.initial());

  void setRole(String role) async {
    emit(const RoleSelectionState.loading());

    try {
      await roleSelectionRepo.setRole(role);
      emit(RoleSelectionState.success());
    } catch (e) {
      emit(RoleSelectionState.error(e.toString()));
    }
  }
}
