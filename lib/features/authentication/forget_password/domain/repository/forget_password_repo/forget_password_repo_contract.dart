import '../../../../../../config/base_classes/base_response.dart';
import '../../../../auth_response/auth_base_response.dart';
import '../../../data/models/forget_password/forget_password_request.dart';

abstract class ForgetPasswordRepoContract {
  Future<BaseResponse<AuthBaseResponse>> forgetPassword(
    ForgetPasswordRequest request,
  );
}
