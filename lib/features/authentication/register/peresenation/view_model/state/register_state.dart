import 'package:exam_app_elevate/config/base_state/base_state.dart';
import 'package:exam_app_elevate/features/authentication/entity/AuthEntity.dart';

class RegisterState {
  BaseState<AuthEntity> registerState = BaseState<AuthEntity>(
    isLoading: false,
    data: null,
    errorMessage: null,
  );

  // UI State (important for MVI)


  RegisterState({
    required this.registerState,

  });

  RegisterState copyWith({
    BaseState<AuthEntity>? registerState,
    String? email,
    String? password,
    bool? isPasswordVisible,
    bool? isButtonEnabled,
  }) {
    return RegisterState(
      registerState: registerState ?? this.registerState,

    );
  }

  static RegisterState initial() {
    return RegisterState(
      registerState: BaseState<AuthEntity>(
        isLoading: false,
        data: null,
        errorMessage: null,
      ),

    );
  }
}
