import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_and_name_state.freezed.dart';

@freezed
class PictureAndNameState with _$PictureAndNameState {
  const factory PictureAndNameState.initial() = _Initial;
  const factory PictureAndNameState.loading() = PictureAndNameLoading;
  const factory PictureAndNameState.success() = PictureAndNameSuccess;
  const factory PictureAndNameState.error(String message) = PictureAndNameError;
}
