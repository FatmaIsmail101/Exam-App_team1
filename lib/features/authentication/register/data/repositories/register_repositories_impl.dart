import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/authentication/login/domain/entity/login_entity.dart';
import 'package:exam_app_elevate/features/authentication/register/data/datasources/register_remote_data_source.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';
import 'package:exam_app_elevate/features/authentication/register/domain/repositories/register_repositories_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepositoryContract)
class RegisterRepositoriesImpl extends RegisterRepositoryContract {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoriesImpl(this.remoteDataSource);

  @override
  Future<BaseResponse<LoginEntity>> register(
    RegisterRequestModel request,
  ) async {
    try {
      final registerModel = await remoteDataSource.register(request);

      return SuccessBaseResponse(
        message: "success",
        data: registerModel.toEntity(),
      );
    } catch (e) {
      return ErrorBaseResponse(message: e.toString(), code: 500);
    }
  }
}
