import 'package:exam_app_elevate/features/authentication/forget_password/domain/repository/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../data/models/request_model/forget_password_request.dart';
import '../../data/models/response_model/forget_password_response.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepoContract repo;

  ForgetPasswordUseCase(this.repo);

  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  ) {
    return repo.forgetPassword(request);
  }
}
