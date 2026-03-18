import 'package:exam_app_elevate/features/authentication/login/domain/entity/login_entity.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';
import 'package:exam_app_elevate/features/authentication/register/domain/repositories/register_repositories_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';

@injectable
class RegisterUseCase {
  final RegisterRepositoryContract repository;

  RegisterUseCase(this.repository);

  Future<BaseResponse<LoginEntity>> call(RegisterRequestModel request) {
    return repository.register(request);
  }
}