import 'package:exam_app_elevate/features/authentication/forget_password/data/models/forget_password/forget_password_request.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/domain/use_case/forget_password_use_case.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/presentation/view_model/states/forget_password_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_classes/base_response.dart';
import '../../../../../config/base_classes/base_state.dart';
import '../../data/models/forget_password/forget_password_response.dart';
import '../../data/models/verify_email/verify_email_request.dart';
import '../../data/models/verify_email/verify_email_response.dart';
import '../../domain/use_case/verify_email_use_case.dart';

part 'states/forget_password_view_model_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _sendEmailuUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  ForgetPasswordViewModel(this._sendEmailuUseCase, this._verifyEmailUseCase)
    : super(ForgetPasswordState.initial());
  Future<void> doIntent({
    ForgetPasswordEvent? event,
    ForgetPasswordRequest? request,
    VerifyEmailRequest? verifyEmailRequest,
  }) async {
    switch (event) {
      case SendEmailEvent():
        await _sendEmail(request ?? ForgetPasswordRequest(email: ""));
        break;
      case VerifyEmailEvent():
        await _verifyEmail(verifyEmailRequest ?? VerifyEmailRequest(code: ""));
        break;
      case null:
        break;
    }
  }

  Future<void> _sendEmail(ForgetPasswordRequest request) async {
    emit(
      state.copyWith(
        authBaseResponse: BaseState<ForgetPasswordResponse>(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );
    final response = await _sendEmailuUseCase.forgetPassword(request);
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponse>():
        emit(
          state.copyWith(
            authBaseResponse: BaseState<ForgetPasswordResponse>(
              isLoading: false,
              data: response.data,
              errorMessage: null,
            ),
          ),
        );
        break;
      case ErrorBaseResponse<ForgetPasswordResponse>():
        emit(
          state.copyWith(
            authBaseResponse: BaseState<ForgetPasswordResponse>(
              isLoading: false,
              data: null,
              errorMessage: response.message,
            ),
          ),
        );
        break;
    }
  }

  Future<void> _verifyEmail(VerifyEmailRequest request) async {
    emit(
      state.copyWith(
        verifyEmailResponse: BaseState<VerifyEmailResponse>(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );
    final response = await _verifyEmailUseCase.verifyEmail(request);
    switch (response) {
      case SuccessBaseResponse<VerifyEmailResponse>():
        emit(
          state.copyWith(
            verifyEmailResponse: BaseState<VerifyEmailResponse>(
              isLoading: false,
              data: response.data,
              errorMessage: null,
            ),
          ),
        );
        break;
      case ErrorBaseResponse<VerifyEmailResponse>():
        emit(
          state.copyWith(
            verifyEmailResponse: BaseState<VerifyEmailResponse>(
              isLoading: false,
              data: null,
              errorMessage: response.message,
            ),
          ),
        );
        break;
    }
  }
}
