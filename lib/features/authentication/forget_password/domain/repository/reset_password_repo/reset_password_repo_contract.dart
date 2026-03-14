import 'package:exam_app_elevate/features/authentication/auth_response/auth_base_response.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../../data/models/reset_password/reset_password_request.dart';

abstract class ResetPasswordRepoContract {
  Future<BaseResponse<AuthBaseResponse>> resetPassword(
    ResetPasswordRequest request,
  );
}
