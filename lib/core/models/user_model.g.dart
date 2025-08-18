// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  accounts: (json['accounts'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, AccountModel.fromJson(e as Map<String, dynamic>)),
  ),
  activeAccountIndex: (json['activeAccountIndex'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'accounts': instance.accounts.map((k, e) => MapEntry(k, e.toJson())),
      'activeAccountIndex': instance.activeAccountIndex,
    };
