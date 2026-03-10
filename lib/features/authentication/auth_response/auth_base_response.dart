// To parse this JSON data, do
//
//     final authBaseResponse = authBaseResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'auth_base_response.g.dart';

@JsonSerializable()
class AuthBaseResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "info")
  final String? info;

  AuthBaseResponse({this.message, this.info});

  factory AuthBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthBaseResponseToJson(this);
}
