import 'package:exam_app_elevate/features/authentication/forget_password/domain/repository/reset_password_repo/reset_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../auth_response/auth_base_response.dart';
import '../../data/models/reset_password/reset_password_request.dart';

@injectable
class ResetPasswordUseCase {
  ResetPasswordRepoContract repo;

  ResetPasswordUseCase(this.repo);

  Future<BaseResponse<AuthBaseResponse>> resetPassword(
    ResetPasswordRequest request,
  ) {
    return repo.resetPassword(request);
  }
}
