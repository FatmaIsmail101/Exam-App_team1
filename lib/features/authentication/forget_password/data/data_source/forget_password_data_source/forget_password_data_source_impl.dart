// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/data_source/forget_password_data_source/forget_password_data_source_contract.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/forget_password/forget_password_request.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';

import '../../../../../../config/base_response/base_response.dart';
import '../../../api/forget_password_client.dart';
import '../../models/forget_password/forget_password_response.dart';

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
}
