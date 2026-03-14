part of '../forget_password_view_model_cubit.dart';

class ForgetPasswordState {
  final String? email;
  BaseState<ForgetPasswordResponse> forgetePasswordState =
      BaseState<ForgetPasswordResponse>(
        isLoading: true,
        data: null,
        errorMessage: null,
      );
  BaseState<VerifyEmailResponse> verifyEmailState =
      BaseState<VerifyEmailResponse>(
        isLoading: true,
        data: null,
        errorMessage: null,
      );
  BaseState<AuthBaseResponse> resetPasswordState = BaseState<AuthBaseResponse>(
    isLoading: true,
    data: null,
    errorMessage: null,
  );

  ForgetPasswordState({
    this.email,
    required this.forgetePasswordState,
    required this.verifyEmailState,
    required this.resetPasswordState,
  });

  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordResponse>? authBaseResponse,
    BaseState<VerifyEmailResponse>? verifyEmailResponse,
    BaseState<AuthBaseResponse>? resetPasswordResponse,
    String? email,
  }) {
    return ForgetPasswordState(
      forgetePasswordState: authBaseResponse ?? forgetePasswordState,
      verifyEmailState: verifyEmailResponse ?? verifyEmailState,
      resetPasswordState: resetPasswordResponse ?? resetPasswordState,
      email: email ?? this.email,
    );
  }

  static ForgetPasswordState initial() {
    return ForgetPasswordState(
      email: null,
      forgetePasswordState: BaseState<ForgetPasswordResponse>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
      verifyEmailState: BaseState<VerifyEmailResponse>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
      resetPasswordState: BaseState<AuthBaseResponse>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
    );
  }
}
