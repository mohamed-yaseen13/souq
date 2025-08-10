// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    _AccountModel(
      email: json['email'] as String,
      providerMethod: (json['providerMethod'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      role: json['role'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      createdAt: _$JsonConverterFromJson<Object, Timestamp>(
        json['createdAt'],
        const TimestampConverter().fromJson,
      ),
    );

Map<String, dynamic> _$AccountModelToJson(_AccountModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'providerMethod': instance.providerMethod,
      'role': instance.role,
      'phone': instance.phone,
      'createdAt': _$JsonConverterToJson<Object, Timestamp>(
        instance.createdAt,
        const TimestampConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
