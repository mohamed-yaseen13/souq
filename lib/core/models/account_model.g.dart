// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
  email: json['email'] as String,
  phone: json['phone'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'role': instance.role,
      'phone': instance.phone,
    };
