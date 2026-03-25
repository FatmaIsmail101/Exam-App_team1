import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../auth_response/auth_base_response.dart';
import '../../data/models/request_model/reset_password_request.dart';
import '../repository/forget_password_repo_contract.dart';

@injectable
class ResetPasswordUseCase {
  ForgetPasswordRepoContract repo;

  ResetPasswordUseCase(this.repo);

  Future<BaseResponse<AuthBaseResponse>> resetPassword(
    ResetPasswordRequest request,
  ) {
    return repo.resetPassword(request);
  }
}
