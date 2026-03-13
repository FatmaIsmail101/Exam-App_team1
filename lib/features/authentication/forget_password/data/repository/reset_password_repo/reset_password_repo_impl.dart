import 'package:exam_app_elevate/features/authentication/auth_response/auth_base_response.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/data_source/reset_password/reset_password_data_source_contract.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/reset_password/reset_password_request.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/domain/repository/reset_password_repo/reset_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_response/base_response.dart';

@Injectable(as: ResetPasswordRepoContract)
class ResetPasswordRepoImpl implements ResetPasswordRepoContract {
  ResetPasswordDataSourceContract dataSource;

  ResetPasswordRepoImpl(this.dataSource);

  @override
  Future<BaseResponse<AuthBaseResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    final response = await dataSource.resetPassword(request);
    switch (response) {
      case SuccessBaseResponse<AuthBaseResponse>():
        return SuccessBaseResponse<AuthBaseResponse>(data: response.data);
      case ErrorBaseResponse<AuthBaseResponse>():
        return ErrorBaseResponse<AuthBaseResponse>(
          message: response.message,
          code: response.code,
        );
      default:
        return ErrorBaseResponse<AuthBaseResponse>(
          message: "Something went wrong",
          code: 500,
        );
    }
    throw Exception("Response must be Success or Error");
  }
}
