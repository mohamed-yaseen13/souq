import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/profile/delete_account/data/delete_account_repo.dart';
import 'package:souq/features/profile/delete_account/logic/cubit/delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountRepo deleteAccountRepo;

  DeleteAccountCubit(this.deleteAccountRepo)
    : super(DeleteAccountState.initial());

  Future<void> deleteAccount() async {
    emit(const DeleteAccountState.loading());

    try {
      await deleteAccountRepo.deleteAccount();
      emit(DeleteAccountState.success());
    } catch (e) {
      emit(DeleteAccountState.error(e.toString()));
    }
  }
}
