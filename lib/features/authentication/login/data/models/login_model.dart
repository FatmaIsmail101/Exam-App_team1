import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/login_entity.dart';
import 'user_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final String token;
  final UserModel user;

  LoginModel({
    required this.token,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  LoginEntity toEntity() {
    return LoginEntity(
      token: token,
      user: user.toEntity(),
    );
  }
}