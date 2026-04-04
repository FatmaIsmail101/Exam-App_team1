import 'package:exam_app_elevate/features/authentication/entity/AuthEntity.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';
import 'package:exam_app_elevate/features/authentication/register/domain/repositories/register_repositories_contract.dart';
import 'package:injectable/injectable.dart';
import '../../../../../config/base_response/base_response.dart';

@injectable
class RegisterUseCase {
  final RegisterRepositoryContract repository;

  RegisterUseCase(this.repository);

  Future<BaseResponse<AuthEntity>> call(RegisterRequestModel request) {
    return repository.register(request);
  }
}
