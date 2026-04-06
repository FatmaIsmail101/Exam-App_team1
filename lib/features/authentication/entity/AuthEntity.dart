
import 'package:exam_app_elevate/features/authentication/entity/user_entity.dart';

class AuthEntity {
  final String token;
  final UserEntity user;

  AuthEntity({
    required this.token,
    required this.user,
  });
}