import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:souq/core/helpers/json_converters.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
abstract class AccountModel with _$AccountModel {
  const factory AccountModel({
    required String uid,
    required String name,
    required String email,
    @Default('') String role,
    @Default('') String phone,
    @TimestampConverter() Timestamp? createdAt,
    @Default(false) bool isAccountHasImage,
    @Default('') String address,
    @Default(0) int accountImageNumber,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
