import 'package:exam_app_elevate/features/authentication/auth_response/user_dto.dart';
import 'package:exam_app_elevate/features/authentication/entity/AuthEntity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_base_response.g.dart';

@JsonSerializable()
class AuthBaseResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDTO? user;

  AuthBaseResponse({this.message, this.token, this.user});

  factory AuthBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthBaseResponseFromJson(json);

     AuthEntity toDomain() {
        return AuthEntity(
          token: token!,
          user : user!.toDomain(),
        );
      }
}
