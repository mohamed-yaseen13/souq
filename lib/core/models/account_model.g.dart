// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    _AccountModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      createdAt: _$JsonConverterFromJson<Object, Timestamp>(
        json['createdAt'],
        const TimestampConverter().fromJson,
      ),
      isAccountHasImage: json['isAccountHasImage'] as bool? ?? false,
      address: json['address'] as String? ?? '',
      accountImageNumber: (json['accountImageNumber'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AccountModelToJson(_AccountModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'phone': instance.phone,
      'createdAt': _$JsonConverterToJson<Object, Timestamp>(
        instance.createdAt,
        const TimestampConverter().toJson,
      ),
      'isAccountHasImage': instance.isAccountHasImage,
      'address': instance.address,
      'accountImageNumber': instance.accountImageNumber,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
