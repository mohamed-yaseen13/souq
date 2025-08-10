import 'package:json_annotation/json_annotation.dart';
import 'package:souq/core/models/account_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final String id;
  final String name;
  final Map<String, AccountModel> accounts;
  final int activeAccountIndex;

  UserModel({
    required this.id,
    required this.name,
    required this.accounts,
    this.activeAccountIndex = 0,
  });

  AccountModel get activeAccount => accounts[activeAccountIndex.toString()]!;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
