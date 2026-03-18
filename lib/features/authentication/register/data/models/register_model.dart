import 'package:exam_app_elevate/features/authentication/login/data/models/user_model.dart';
import 'package:exam_app_elevate/features/authentication/login/domain/entity/login_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'register_model.g.dart';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

@JsonSerializable()
class RegisterModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserModel? user;

  RegisterModel({
    this.message,
    this.token,
    this.user,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);


  LoginEntity toEntity() {
    if (user == null) {
      throw Exception('User data is null');
    }
    return LoginEntity(
      token: token!,
      user: user!.toEntity(),
    );
  }
}
