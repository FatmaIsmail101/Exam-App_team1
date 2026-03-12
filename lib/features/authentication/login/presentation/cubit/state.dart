import 'package:equatable/equatable.dart';

import '../../data/models/login_model.dart';
import '../../domain/entity/login_entity.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

// initial state
class LoginInitial extends LoginState {}

// loading state
class LoginLoading extends LoginState {}

// success state
class LoginSuccess extends LoginState {
  final LoginEntity login;

  const LoginSuccess(this.login);

  @override
  List<Object?> get props => [login];
}

// error state
class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object?> get props => [message];
}