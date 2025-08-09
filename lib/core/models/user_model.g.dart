// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  accounts: (json['accounts'] as List<dynamic>)
      .map((e) => AccountModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  activeAccountIndex: (json['activeAccountIndex'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'accounts': instance.accounts.map((e) => e.toJson()).toList(),
  'activeAccountIndex': instance.activeAccountIndex,
};
