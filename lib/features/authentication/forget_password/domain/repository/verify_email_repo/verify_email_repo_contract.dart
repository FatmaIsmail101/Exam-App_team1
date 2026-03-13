import 'package:exam_app_elevate/features/authentication/forget_password/data/models/verify_email/verify_email_response.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../../data/models/verify_email/verify_email_request.dart';

abstract class VerifyEmailRepoContract {
  Future<BaseResponse<VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequest request,
  );
}
