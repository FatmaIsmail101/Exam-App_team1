import 'package:exam_app_elevate/features/authentication/forget_password/data/models/forget_password/forget_password_response.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../models/forget_password/forget_password_request.dart';

abstract class ForgetPasswordDataSourceContract {
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  );
}
