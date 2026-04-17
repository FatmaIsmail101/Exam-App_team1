import '../../../../../config/base_response/base_response.dart';
import '../../../auth_response/auth_base_response.dart';
import '../../data/models/request_model/forget_password_request.dart';
import '../../data/models/request_model/reset_password_request.dart';
import '../../data/models/request_model/verify_email_request.dart';
import '../../data/models/response_model/forget_password_response.dart';
import '../../data/models/response_model/verify_email_response.dart';

abstract class ForgetPasswordRepoContract {
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
