import 'package:exam_app_elevate/features/authentication/forget_password/data/models/forget_password/forget_password_request.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/domain/use_case/forget_password_use_case.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/presentation/view_model/states/forget_password_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_classes/base_response.dart';
import '../../../../../config/base_classes/base_state.dart';
import '../../data/models/forget_password/forget_password_response.dart';

part 'states/forget_password_view_model_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  ForgetPasswordUseCase _sendEmailuUseCase;
  ForgetPasswordViewModel(this._sendEmailuUseCase)
    : super(ForgetPasswordState.initial());
  Future<void> doIntent({
    required ForgetPasswordEvent event,
    required ForgetPasswordRequest request,
  }) async {
    switch (event) {
      case SendEmailEvent():
        await _sendEmail(request);
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
}
