import 'package:json_annotation/json_annotation.dart';

part 'signup_test_request_model.g.dart';

@JsonSerializable()
class SignupTestRequestModel {
  final String name;
  final String email;

  SignupTestRequestModel({required this.name, required this.email});

  factory SignupTestRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignupTestRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignupTestRequestModelToJson(this);
}
