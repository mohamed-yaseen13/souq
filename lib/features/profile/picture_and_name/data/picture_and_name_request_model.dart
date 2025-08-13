import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:souq/core/helpers/json_converters.dart';

part 'picture_and_name_request_model.g.dart';

@JsonSerializable()
class PictureAndNameRequestModel {
  final String? name;

  @FileConverter()
  final File? imageFile;

  PictureAndNameRequestModel({this.imageFile, this.name});

  factory PictureAndNameRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PictureAndNameRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$PictureAndNameRequestModelToJson(this);
}
