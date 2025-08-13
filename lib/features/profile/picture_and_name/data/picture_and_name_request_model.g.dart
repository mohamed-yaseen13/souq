// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_and_name_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PictureAndNameRequestModel _$PictureAndNameRequestModelFromJson(
  Map<String, dynamic> json,
) => PictureAndNameRequestModel(
  imageFile: const FileConverter().fromJson(json['imageFile'] as String?),
  name: json['name'] as String?,
);

Map<String, dynamic> _$PictureAndNameRequestModelToJson(
  PictureAndNameRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'imageFile': const FileConverter().toJson(instance.imageFile),
};
