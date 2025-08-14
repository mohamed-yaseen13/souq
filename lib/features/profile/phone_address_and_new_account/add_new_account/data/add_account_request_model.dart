import 'package:json_annotation/json_annotation.dart';

part 'add_account_request_model.g.dart';

@JsonSerializable()
class AddAccountRequestModel {
  final String email;

  AddAccountRequestModel({required this.email});

  factory AddAccountRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddAccountRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddAccountRequestModelToJson(this);
}
