import 'package:souq/core/database/database.dart';

class RoleSelectionRepo {
  RoleSelectionRepo();

  Future<void> setRole(String role) async {
    await Database.updateUserRole(role);
  }
}
