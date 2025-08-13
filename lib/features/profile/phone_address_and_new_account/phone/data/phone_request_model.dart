import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_request_model.g.dart';

@JsonSerializable()
class PhoneRequestModel {
  final String phoneNumber;

  PhoneRequestModel({required this.phoneNumber});

  factory PhoneRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneRequestModelToJson(this);
}
