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
  ForgetPasswordState({
    required this.forgetePasswordState,
    required this.verifyEmailState,
  });
  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordResponse>? authBaseResponse,
    BaseState<VerifyEmailResponse>? verifyEmailResponse,
  }) {
    return ForgetPasswordState(
      forgetePasswordState: authBaseResponse ?? this.forgetePasswordState,
      verifyEmailState: verifyEmailResponse ?? this.verifyEmailState,
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
    );
  }
}
