import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.sendingOtp() = LoginsendingOtp;

  const factory LoginState.otpSent({required String email}) = LoginOtpSent;

  const factory LoginState.verifyingOtp({required String email}) =
      LoginVerifyingOtp;

  const factory LoginState.loggedIn({required String email}) = LoginLoggedIn;

  const factory LoginState.error(String message) = LoginError;
}
