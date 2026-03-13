part of '../forget_password_view_model_cubit.dart';

class ForgetPasswordState {
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
    required this.forgetePasswordState,
    required this.verifyEmailState,
    required this.resetPasswordState,
  });

  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordResponse>? authBaseResponse,
    BaseState<VerifyEmailResponse>? verifyEmailResponse,
    BaseState<AuthBaseResponse>? resetPasswordResponse,
  }) {
    return ForgetPasswordState(
      forgetePasswordState: authBaseResponse ?? forgetePasswordState,
      verifyEmailState: verifyEmailResponse ?? verifyEmailState,
      resetPasswordState: resetPasswordResponse ?? resetPasswordState,
    );
  }

  static ForgetPasswordState initial() {
    return ForgetPasswordState(
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
