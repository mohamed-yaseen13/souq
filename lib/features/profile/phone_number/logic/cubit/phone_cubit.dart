import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/profile/phone_number/data/phone_repo.dart';
import 'package:souq/features/profile/phone_number/data/phone_request_model.dart';
import 'package:souq/features/profile/phone_number/logic/cubit/phone_state.dart';

class PhoneCubit extends Cubit<PhoneState> {
  final PhoneRepo repo;

  PhoneCubit(this.repo) : super(PhoneState.initial());

  void verifyPhoneNumber(PhoneRequestModel request) async {
    emit(const PhoneState.loading());

    try {
      await repo.verifyPhoneNumber(request);
      emit(PhoneState.success());
    } catch (e) {
      emit(PhoneState.error(e.toString()));
    }
  }
}
