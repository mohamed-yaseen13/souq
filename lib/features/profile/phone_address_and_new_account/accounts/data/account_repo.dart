import 'package:souq/core/database/database.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/models/account_model.dart';

class AccountRepo {
  Future<List<AccountModel>> getUserAccounts() async {
    final userId = SharedPref.getUserId();

    final map = await Database.getUserAccountsMap(userId);

    final keys = map.keys.toList()..sort();
    return [for (final k in keys) map[k]!];
  }
}
