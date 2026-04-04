import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/authentication/auth_response/auth_base_response.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';

abstract class RegisterRemoteDataSourceContract {
  Future<BaseResponse<AuthBaseResponse>> register(RegisterRequestModel request);
}


