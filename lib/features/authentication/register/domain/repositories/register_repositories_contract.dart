import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/authentication/login/domain/entity/login_entity.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';

abstract class RegisterRepositoryContract {
  Future<BaseResponse<LoginEntity>> register(RegisterRequestModel request);
}
