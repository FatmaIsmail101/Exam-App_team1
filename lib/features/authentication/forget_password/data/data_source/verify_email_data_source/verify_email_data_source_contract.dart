import 'package:exam_app_elevate/config/base_classes/base_response.dart';

import '../../models/verify_email/verify_email_request.dart';
import '../../models/verify_email/verify_email_response.dart';

abstract class VerifyEmailDataSourceContract {
  Future<BaseResponse<VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequest request,
  );
}
