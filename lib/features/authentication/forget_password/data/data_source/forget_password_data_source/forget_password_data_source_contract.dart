import 'package:exam_app_elevate/features/authentication/auth_response/auth_base_response.dart';

import '../../../../../../config/base_classes/base_response.dart';
import '../../models/forget_password/forget_password_request.dart';

abstract class ForgetPasswordDataSourceContract {
  Future<BaseResponse<AuthBaseResponse>> forgetPassword(
    ForgetPasswordRequest request,
  );
}
