// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  accounts: (json['accounts'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, AccountModel.fromJson(e as Map<String, dynamic>)),
  ),
  activeAccountIndex: (json['activeAccountIndex'] as num?)?.toInt() ?? 0,
  imageUrl: json['imageUrl'] as String? ?? '',
  address: json['address'] as String? ?? '',
  createdAt: _$JsonConverterFromJson<Object, Timestamp>(
    json['createdAt'],
    const TimestampConverter().fromJson,
  ),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accounts': instance.accounts.map((k, e) => MapEntry(k, e.toJson())),
      'activeAccountIndex': instance.activeAccountIndex,
      'imageUrl': instance.imageUrl,
      'address': instance.address,
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
