import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/profile/add_new_account/data/add_account_repo.dart';
import 'package:souq/features/profile/add_new_account/logic/cubit/add_account_state.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  final AddAccountRepo addAccountRepo;

  AddAccountCubit(this.addAccountRepo) : super(AddAccountState.initial());

  void sendOtp(String email) async {
    emit(const AddAccountState.sendingOtp());
    try {
      await addAccountRepo.sendEmailOtp(email);
      emit(AddAccountState.otpSent(email: email));
    } catch (e) {
      emit(AddAccountState.error(e.toString()));
    }
  }

  void verifyOtpThenAddAccount({
    required String email,
    required String otp,
  }) async {
    emit(AddAccountState.verifyingOtp(email: email));
    try {
      await addAccountRepo.verifyOtpThenAddAccount(email, otp);
      emit(AddAccountState.added(email: email));
    } catch (e) {
      emit(AddAccountState.error(e.toString()));
    }
  }
}
