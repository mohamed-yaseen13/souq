import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/profile/picture_and_name/data/picture_and_name_repo.dart';
import 'package:souq/features/profile/picture_and_name/data/picture_and_name_request_model.dart';
import 'package:souq/features/profile/picture_and_name/logic/cubit/picture_and_name_state.dart';

class PictureAndNameCubit extends Cubit<PictureAndNameState> {
  final PictureAndNameRepo repo;

  PictureAndNameCubit(this.repo) : super(PictureAndNameState.initial());

  void editPictureOrName(PictureAndNameRequestModel request) async {
    emit(const PictureAndNameState.loading());

    try {
      await repo.setImageAndNameToDatabase(request);
      emit(PictureAndNameState.success());
    } catch (e) {
      emit(PictureAndNameState.error(e.toString()));
    }
  }

  void deleteUserPicture() async {
    emit(const PictureAndNameState.loading());

    try {
      await repo.deleteUserPicture();
      emit(PictureAndNameState.success());
    } catch (e) {
      emit(PictureAndNameState.error(e.toString()));
    }
  }
}
