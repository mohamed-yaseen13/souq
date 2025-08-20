import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_state.freezed.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.initial() = _Initial;

  const factory DeleteAccountState.loading() = DeleteAccountLoading;

  const factory DeleteAccountState.success() = DeleteAccountSuccess;

  const factory DeleteAccountState.error(String message) = DeleteAccountError;
}
