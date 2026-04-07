import '../../../../../config/base_state/base_state.dart';
import '../../domain/entity/login_entity.dart';

class LoginState extends BaseState<LoginEntity> {
   LoginState({super.isLoading, super.errorMessage, super.data});

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    LoginEntity? data,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      data: data ?? this.data,
    );
  }
}