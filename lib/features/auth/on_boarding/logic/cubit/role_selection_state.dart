import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_selection_state.freezed.dart';

@freezed
class RoleSelectionState with _$RoleSelectionState {
  const factory RoleSelectionState.initial() = _Initial;
  const factory RoleSelectionState.loading() = RoleSelectionLoading;
  const factory RoleSelectionState.success() = RoleSelectionSuccess;
  const factory RoleSelectionState.error(String message) = RoleSelectionError;
}
