import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = SignupLoading;
  const factory SignupState.success() = SignupSuccess;
  const factory SignupState.error(String message) = SignupError;
}
