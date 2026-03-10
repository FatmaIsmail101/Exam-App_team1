import 'package:exam_app_elevate/features/authentication/forget_password/data/data_source/forget_password_data_source/forget_password_data_source_contract.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/forget_password/forget_password_request.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/forget_password/forget_password_response.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../../../config/base_classes/base_response.dart';
import '../../../domain/repository/forget_password_repo/forget_password_repo_contract.dart';

@Injectable(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImpl implements ForgetPasswordRepoContract {
  ForgetPasswordDataSourceContract dataSource;
  ForgetPasswordRepoImpl(this.dataSource);
  final talker = Talker();
  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    final response = await dataSource.forgetPassword(request);
    switch (response) {
      case SuccessBaseResponse<ForgetPasswordResponse>():
        talker.debug(response.data?.message);
        return SuccessBaseResponse<ForgetPasswordResponse>(data: response.data);

      case ErrorBaseResponse<ForgetPasswordResponse>():
        talker.warning('The pizza is over 😥');
        talker.error(response.message);
        talker.debug('Thinking about order new one 🤔');
        return ErrorBaseResponse<ForgetPasswordResponse>(
          message: response.message,
          code: response.code,
        );
    }
  }
}
