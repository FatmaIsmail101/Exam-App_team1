part of '../forget_password_view_model_cubit.dart';

class ForgetPasswordState {
  BaseState<ForgetPasswordResponse> authBaseResponse =
      BaseState<ForgetPasswordResponse>(
        isLoading: true,
        data: null,
        errorMessage: null,
      );
  ForgetPasswordState({required this.authBaseResponse});
  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordResponse>? authBaseResponse,
  }) {
    return ForgetPasswordState(
      authBaseResponse: authBaseResponse ?? this.authBaseResponse,
    );
  }

  static ForgetPasswordState initial() {
    return ForgetPasswordState(
      authBaseResponse: BaseState<ForgetPasswordResponse>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
    );
  }
}
