import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/authentication/auth_response/auth_base_response.dart';
import 'package:exam_app_elevate/features/authentication/auth_response/user_dto.dart';
import 'package:exam_app_elevate/features/authentication/entity/AuthEntity.dart';
import 'package:exam_app_elevate/features/authentication/entity/user_entity.dart';
import 'package:exam_app_elevate/features/authentication/register/data/datasources/register_remote_data_source_contract.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';
import 'package:exam_app_elevate/features/authentication/register/domain/repositories/register_repositories_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepositoryContract)
class RegisterRepositoriesImpl extends RegisterRepositoryContract {
  final RegisterRemoteDataSourceContract remoteDataSource;

  RegisterRepositoriesImpl(this.remoteDataSource);

  @override
  Future<BaseResponse<AuthEntity>> register(
    RegisterRequestModel request,
  ) async {
    final BaseResponse<AuthBaseResponse> authBaseResponse =
        await remoteDataSource.register(request);

    switch (authBaseResponse) {
      case SuccessBaseResponse<AuthBaseResponse> success:
        final AuthBaseResponse authBaseResponse = success.data!;
        final AuthEntity authEntity = authBaseResponse.toDomain();
        return SuccessBaseResponse(data: authEntity);
      case ErrorBaseResponse<AuthBaseResponse> error:
        return ErrorBaseResponse(message: error.message);
    }
  }
}
