// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exam_app_elevate/config/secure/flutter_secure_storage.dart';
import 'package:exam_app_elevate/core/values/app_keys.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/data_source/forget_password_data_source_contract.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/request_model/forget_password_request.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../auth_response/auth_base_response.dart';
import '../../api/forget_password_client.dart';
import '../models/request_model/reset_password_request.dart';
import '../models/request_model/verify_email_request.dart';
import '../models/response_model/forget_password_response.dart';
import '../models/response_model/verify_email_response.dart';

@Injectable(as: ForgetPasswordDataSourceContract)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSourceContract {
  ForgetPasswordClient client;

  ForgetPasswordDataSourceImpl({required this.client});

  final talker = Talker();

  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    try {
      final response = await client.forgetPassword(request);
      CashingFlutterSecureStorage.saveToken(AppKeys.email, request.email ?? "");
      // لو الـ API رجع 200/201
      return SuccessBaseResponse<ForgetPasswordResponse>(data: response);
    } on DioException catch (e) {
      // هنا بقى اللعب كله.. بنمسك الـ Error اللي جاي من السيرفر
      final serverMessage =
          e.response?.data['message'] ?? "Something went wrong";
      final serverCode = e.response?.statusCode;

      return ErrorBaseResponse<ForgetPasswordResponse>(
        message: serverMessage,
        code: serverCode,
      );
    } on TimeoutException catch (e) {
      talker.warning('The pizza is over 😥');
      talker.error(e.message);
      talker.debug('Thinking about order new one 🤔');
      return ErrorBaseResponse<ForgetPasswordResponse>(
        message: e.message ?? "Timeout Exception",
      );
    } catch (e) {
      talker.error(e.toString());
      return ErrorBaseResponse<ForgetPasswordResponse>(message: e.toString());
    }
  }

  @override
  Future<BaseResponse<AuthBaseResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final response = await client.resetPassword(request);
      CashingFlutterSecureStorage.saveToken(
        AppKeys.token,
        response.token ?? "",
      );
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
