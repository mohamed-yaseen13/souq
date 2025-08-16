import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.sendingOtp() = SignupSendingOtp;
  const factory SignupState.otpSent({required String email}) = SignupOtpSent;
  const factory SignupState.verifyingOtp({required String email}) =
      SignupVerifyingOtp;
  const factory SignupState.signedUp({required String email}) = SignupSignedUp;
  const factory SignupState.error(String message) = SignupError;
}
