// state.dart
import 'package:equatable/equatable.dart';
import 'package:exam_app_elevate/features/authentication/login/domain/entity/login_entity.dart';


abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final LoginEntity login;
  const RegisterSuccess(this.login);

  @override
  List<Object?> get props => [login];
}

class RegisterError extends RegisterState {
  final String message;
  final int code;

  const RegisterError(this.message, this.code);

  bool get isUnauthorized => code == 401;
  bool get isServerError => code >= 500;

  @override
  List<Object?> get props => [message, code];
}
