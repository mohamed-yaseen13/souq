import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:souq/core/models/account_model.dart';

part 'accounts_state.freezed.dart';

@freezed
class AccountsState with _$AccountsState {
  const factory AccountsState.initial() = _Initial;

  const factory AccountsState.loading() = AccountsLoading;

  const factory AccountsState.switchLoading() = AccountsSwitchLoading;

  const factory AccountsState.success(List<AccountModel> accounts) =
      AccountsSuccess;

  const factory AccountsState.switchSuccess() = AccountsSwitchSuccess;

  const factory AccountsState.error(String message) = AccountsError;
}
