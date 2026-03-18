import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../data/models/request_model/verify_email_request.dart';
import '../../data/models/response_model/verify_email_response.dart';
import '../repository/forget_password_repo_contract.dart';

@injectable
class VerifyEmailUseCase {
  ForgetPasswordRepoContract repo;

  VerifyEmailUseCase(this.repo);

  Future<BaseResponse<VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequest request,
  ) {
    return repo.verifyEmail(request);
  }
}
