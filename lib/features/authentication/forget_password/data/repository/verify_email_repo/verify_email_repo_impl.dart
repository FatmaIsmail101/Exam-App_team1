import 'package:exam_app_elevate/features/authentication/forget_password/data/data_source/verify_email_data_source/verify_email_data_source_contract.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/verify_email/verify_email_request.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/verify_email/verify_email_response.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/domain/repository/verify_email_repo/verify_email_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_response/base_response.dart';

@Injectable(as: VerifyEmailRepoContract)
class VerifyEmailRepoImpl implements VerifyEmailRepoContract {
  VerifyEmailDataSourceContract dataSource;

  VerifyEmailRepoImpl(this.dataSource);

  @override
  Future<BaseResponse<VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequest request,
  ) async {
    final response = await dataSource.verifyEmail(request);
    switch (response) {
      case SuccessBaseResponse<VerifyEmailResponse>():
        return response;

      case ErrorBaseResponse<VerifyEmailResponse>():
        return response;
    }
  }
}
