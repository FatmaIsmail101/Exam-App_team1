part of '../forget_password_view_model_cubit.dart';

class ForgetPasswordState {
  BaseState<AuthBaseResponse> authBaseResponse = BaseState<AuthBaseResponse>(
    isLoading: true,
    data: null,
    errorMessage: null,
  );
  ForgetPasswordState({required this.authBaseResponse});
  ForgetPasswordState copyWith({
    BaseState<AuthBaseResponse>? authBaseResponse,
  }) {
    return ForgetPasswordState(
      authBaseResponse: authBaseResponse ?? this.authBaseResponse,
    );
  }

  static ForgetPasswordState initial() {
    return ForgetPasswordState(
      authBaseResponse: BaseState<AuthBaseResponse>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
    );
  }
}
