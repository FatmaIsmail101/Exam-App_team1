import 'dart:async';

import 'package:dio/dio.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/data_source/verify_email_data_source/verify_email_data_source_contract.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/verify_email/verify_email_request.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/verify_email/verify_email_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../../api/forget_password_client.dart';

@Injectable(as: VerifyEmailDataSourceContract)
class VerifyEmailDataSourceImpl implements VerifyEmailDataSourceContract {
  ForgetPasswordClient client;

  VerifyEmailDataSourceImpl(this.client);

  @override
  Future<BaseResponse<VerifyEmailResponse>> verifyEmail(
    VerifyEmailRequest request,
  ) async {
    try {
      final response = await client.verifyEmail(request);
      return SuccessBaseResponse(data: response);
    } on DioException catch (e) {
      return ErrorBaseResponse(message: e.message ?? "");
    } on TimeoutException catch (e) {
      return ErrorBaseResponse(message: e.message ?? "");
    }
  }
}
