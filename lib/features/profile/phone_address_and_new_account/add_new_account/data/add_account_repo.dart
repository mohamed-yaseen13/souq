import 'package:souq/core/database/database.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/data/add_account_request_model.dart';

class AddAccountRepo {
  AddAccountRepo();

  Future<void> addNewAccount(AddAccountRequestModel request) async {
    final bool emailExist = await Database.checkIfEmailExist(request.email);

    if (emailExist) {
      throw Exception("Email Already Exist Try Login");
    }
  }
}
