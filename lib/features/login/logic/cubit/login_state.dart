import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = LoginLoading;

  const factory LoginState.success() = LoginSuccess;

  const factory LoginState.error(String message) = LoginError;
}
