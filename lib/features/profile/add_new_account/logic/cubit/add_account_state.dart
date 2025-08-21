import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_account_state.freezed.dart';

@freezed
class AddAccountState with _$AddAccountState {
  const factory AddAccountState.initial() = _Initial;
  const factory AddAccountState.sendingOtp() = AddAccountSendingOtp;
  const factory AddAccountState.otpSent({required String email}) =
      AddAccountOtpSent;
  const factory AddAccountState.verifyingOtp({required String email}) =
      AddAccountVerifyingOtp;
  const factory AddAccountState.added({required String email}) =
      AddAccountAdded;
  const factory AddAccountState.error(String message) = AddAccountError;
}
