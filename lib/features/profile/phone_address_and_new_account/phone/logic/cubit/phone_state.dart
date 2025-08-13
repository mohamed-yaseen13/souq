import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_state.freezed.dart';

@freezed
class PhoneState with _$PhoneState {
  const factory PhoneState.initial() = _Initial;
  const factory PhoneState.loading() = PhoneLoading;
  const factory PhoneState.success() = PhoneSuccess;
  const factory PhoneState.error(String message) = PhoneError;
}
