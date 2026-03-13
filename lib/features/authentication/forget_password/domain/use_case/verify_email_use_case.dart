import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../data/models/verify_email/verify_email_request.dart';
import '../../data/models/verify_email/verify_email_response.dart';
import '../repository/verify_email_repo/verify_email_repo_contract.dart';

@injectable
class VerifyEmailUseCase {
  VerifyEmailRepoContract repo;

  VerifyEmailUseCase(this.repo);

  Future<BaseResponse<VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequest request,
  ) {
    return repo.verifyEmail(request);
  }
}
