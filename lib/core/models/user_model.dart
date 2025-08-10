import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:souq/core/helpers/json_converters.dart';
import 'package:souq/core/models/account_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required Map<String, AccountModel> accounts,
    @Default(0) int activeAccountIndex,
    @Default('') String imageUrl,
    @Default('') String address,
    @TimestampConverter() Timestamp? createdAt,
  }) = _UserModel;

  const UserModel._();

  AccountModel get activeAccount => accounts[activeAccountIndex.toString()]!;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
