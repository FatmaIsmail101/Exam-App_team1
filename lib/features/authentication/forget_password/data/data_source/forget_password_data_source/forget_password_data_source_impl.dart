import 'dart:async';

import 'package:dio/dio.dart';
import 'package:exam_app_elevate/features/authentication/auth_response/auth_base_response.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/data_source/forget_password_data_source/forget_password_data_source_contract.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/forget_password/forget_password_request.dart';
import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';

import '../../../../../../config/base_classes/base_response.dart';
import '../../../api/forget_password_client.dart';

@Injectable(as: ForgetPasswordDataSourceContract)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSourceContract {
  ForgetPasswordClient client;
  ForgetPasswordDataSourceImpl({required this.client});
  final talker = Talker();

  @override
  Future<BaseResponse<AuthBaseResponse>> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    try {
      final response = await client.forgetPassword(request);
      // لو الـ API رجع 200/201
      return SuccessBaseResponse<AuthBaseResponse>(data: response);
    } on DioException catch (e) {
      // هنا بقى اللعب كله.. بنمسك الـ Error اللي جاي من السيرفر
      final serverMessage =
          e.response?.data['message'] ?? "Something went wrong";
      final serverCode = e.response?.statusCode;

      return ErrorBaseResponse<AuthBaseResponse>(
        message: serverMessage,
        code: serverCode,
      );
    } on TimeoutException catch (e) {
      talker.warning('The pizza is over 😥');
      talker.error(e.message);
      talker.debug('Thinking about order new one 🤔');
      return ErrorBaseResponse<AuthBaseResponse>(
        message: e.message ?? "Timeout Exception",
      );
    } catch (e) {
      talker.error(e.toString());
      return ErrorBaseResponse<AuthBaseResponse>(message: e.toString());
    }
  }
}
