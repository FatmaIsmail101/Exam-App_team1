import '../../../../../../config/base_classes/base_response.dart';
import '../../../data/models/forget_password/forget_password_request.dart';
import '../../../data/models/forget_password/forget_password_response.dart';

abstract class ForgetPasswordRepoContract {
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  );
}
