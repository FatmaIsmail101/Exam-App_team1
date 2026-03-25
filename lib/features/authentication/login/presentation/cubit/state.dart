// state.dart
import 'package:equatable/equatable.dart';

import '../../domain/entity/login_entity.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginEntity login;
  const LoginSuccess(this.login);

  @override
  List<Object?> get props => [login];
}

class LoginError extends LoginState {
  final String message;
  final int code;

  const LoginError(this.message, this.code);

  bool get isUnauthorized => code == 401;
  bool get isServerError => code >= 500;

  @override
  List<Object?> get props => [message, code];
}