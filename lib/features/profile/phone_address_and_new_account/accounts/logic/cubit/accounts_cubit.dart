import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/profile/phone_address_and_new_account/accounts/data/account_repo.dart';
import 'package:souq/features/profile/phone_address_and_new_account/accounts/logic/cubit/accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  final AccountRepo accountRepo;

  AccountsCubit(this.accountRepo) : super(AccountsState.initial());

  void getUserAccounts() async {
    emit(const AccountsState.loading());

    try {
      final accounts = await accountRepo.getUserAccounts();
      emit(AccountsState.success(accounts));
    } catch (e) {
      emit(AccountsState.error(e.toString()));
    }
  }

  Future<void> switchAccount(String email) async {
    emit(const AccountsState.switchLoading());

    try {
      await accountRepo.switchAccount(email);
      emit(AccountsState.switchSuccess());
    } catch (e) {
      emit(AccountsState.error(e.toString()));
    }
  }
}
