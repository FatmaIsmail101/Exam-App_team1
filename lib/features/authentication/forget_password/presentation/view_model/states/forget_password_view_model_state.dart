part of '../forget_password_view_model_cubit.dart';

class ForgetPasswordState {
  final String? email;
  final int? timerValue; // الثواني المتبقية
  final bool? isResendEnabled; // هل زرار إعادة الإرسال متاح؟
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
    this.timerValue = 0,
    this.isResendEnabled = true,
    this.email,
    required this.forgetePasswordState,
    required this.verifyEmailState,
    required this.resetPasswordState,
  });

  ForgetPasswordState copyWith({
    int? timerValue,
    bool? isResendEnabled,
    BaseState<ForgetPasswordResponse>? authBaseResponse,
    BaseState<VerifyEmailResponse>? verifyEmailResponse,
    BaseState<AuthBaseResponse>? resetPasswordResponse,
    String? email,
  }) {
    return ForgetPasswordState(
      timerValue: timerValue ?? this.timerValue,
      isResendEnabled: isResendEnabled ?? this.isResendEnabled,
      forgetePasswordState: authBaseResponse ?? forgetePasswordState,
      verifyEmailState: verifyEmailResponse ?? verifyEmailState,
      resetPasswordState: resetPasswordResponse ?? resetPasswordState,
      email: email ?? this.email,
    );
  }

  static ForgetPasswordState initial() {
    return ForgetPasswordState(
      timerValue: 0,
      isResendEnabled: true,
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
