import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/authentication/entity/AuthEntity.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';

abstract class RegisterRepositoryContract {
  Future<BaseResponse<AuthEntity>> register(RegisterRequestModel request);
}
