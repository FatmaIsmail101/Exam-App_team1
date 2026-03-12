import 'package:exam_app_elevate/features/authentication/login/domain/entity/user_entity.dart';

class LoginEntity {
  final String token;
  final UserEntity user;

  LoginEntity({
    required this.token,
    required this.user,
  });
}