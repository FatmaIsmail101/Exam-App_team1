import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exam_app_elevate/core/values/app_keys.dart';
import 'package:exam_app_elevate/features/authentication/auth_response/auth_base_response.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/data_source/reset_password/reset_password_data_source_contract.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/reset_password/reset_password_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../../../../../config/secure/flutter_secure_storage.dart';
import '../../../api/forget_password_client.dart';

@Injectable(as: ResetPasswordDataSourceContract)
class ResetPasswordDataSourceImpl implements ResetPasswordDataSourceContract {
  ForgetPasswordClient client;

  ResetPasswordDataSourceImpl(this.client);

  @override
  Future<BaseResponse<AuthBaseResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final response = await client.resetPassword(request);
      CashingFlutterSecureStorage.saveToken(AppKeys.token);
      return SuccessBaseResponse<AuthBaseResponse>(data: response);
    } on DioException catch (e) {
      return ErrorBaseResponse<AuthBaseResponse>(
        message: e.response?.data["message"] ?? "",
        code: e.response?.statusCode ?? 0,
      );
    } on TimeoutException catch (e) {
      return ErrorBaseResponse<AuthBaseResponse>(
        message: e.message ?? "",
        code: 408,
      );
    } on SocketException catch (e) {
      return ErrorBaseResponse<AuthBaseResponse>(
        message: e.message ?? "",
        code: 408,
      );
    }
  }
}
