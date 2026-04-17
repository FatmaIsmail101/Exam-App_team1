// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:exam_app_elevate/core/values/end_points.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/response_model/forget_password_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../auth_response/auth_base_response.dart';
import '../data/models/request_model/forget_password_request.dart';
import '../data/models/request_model/reset_password_request.dart';
import '../data/models/request_model/verify_email_request.dart';
import '../data/models/response_model/verify_email_response.dart';

part 'forget_password_client.g.dart';

@RestApi()
@injectable
abstract class ForgetPasswordClient {
  @factoryMethod
  factory ForgetPasswordClient(Dio dio) = _ForgetPasswordClient;

  @POST(AppEndPoints.forgetPasswordEndpoint)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequest request,
  );

  @POST(AppEndPoints.verifyResetPasswordEndpoint)
  Future<VerifyEmailResponse> verifyEmail(@Body() VerifyEmailRequest request);

  @PUT(AppEndPoints.resetPasswordEndpoint)
  Future<AuthBaseResponse> resetPassword(@Body() ResetPasswordRequest request);
}
