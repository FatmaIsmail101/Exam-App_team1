import 'package:json_annotation/json_annotation.dart';

part 'auth_base_response.g.dart';

@JsonSerializable()
class AuthBaseResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;

  AuthBaseResponse({this.message, this.token});

  factory AuthBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthBaseResponseToJson(this);
}
