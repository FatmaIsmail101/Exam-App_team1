import 'package:exam_app_elevate/features/authentication/forget_password/data/models/response_model/forget_password_response.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../auth_response/auth_base_response.dart';
import '../models/request_model/forget_password_request.dart';
import '../models/request_model/reset_password_request.dart';
import '../models/request_model/verify_email_request.dart';
import '../models/response_model/verify_email_response.dart';

abstract class ForgetPasswordDataSourceContract {
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  );
  Future<BaseResponse<AuthBaseResponse>> resetPassword(
    ResetPasswordRequest request,
  );
  Future<BaseResponse<VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequest request,
  );
}
