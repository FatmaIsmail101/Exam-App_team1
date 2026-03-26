import 'package:exam_app_elevate/features/authentication/forget_password/data/data_source/forget_password_data_source_contract.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/request_model/forget_password_request.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/response_model/forget_password_response.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../auth_response/auth_base_response.dart';
import '../../domain/repository/forget_password_repo_contract.dart';
import '../models/request_model/reset_password_request.dart';
import '../models/request_model/verify_email_request.dart';
import '../models/response_model/verify_email_response.dart';

@Injectable(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImpl implements ForgetPasswordRepoContract {
  ForgetPasswordDataSourceContract dataSource;

  ForgetPasswordRepoImpl(this.dataSource);

  final talker = Talker();

  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    final response = await dataSource.forgetPassword(request);
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponse>():
        talker.debug(response.data?.message);
        return SuccessBaseResponse<ForgetPasswordResponse>(data: response.data);

      case ErrorBaseResponse<ForgetPasswordResponse>():
        talker.error(response.message);

        return ErrorBaseResponse<ForgetPasswordResponse>(
          message: response.message,
          code: response.code,
        );
    }
  }

  @override
  Future<BaseResponse<AuthBaseResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    final response = await dataSource.resetPassword(request);
    switch (response) {
      case SuccessBaseResponse<AuthBaseResponse>():
        return SuccessBaseResponse<AuthBaseResponse>(data: response.data);
      case ErrorBaseResponse<AuthBaseResponse>():
        return ErrorBaseResponse<AuthBaseResponse>(
          message: response.message,
          code: response.code,
        );
    }
  }

  @override
  Future<BaseResponse<VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequest request,
  ) async {
    final response = await dataSource.verifyEmail(request);
    switch (response) {
      case SuccessBaseResponse<VerifyEmailResponse>():
        return response;

      case ErrorBaseResponse<VerifyEmailResponse>():
        return response;
    }
  }
}
