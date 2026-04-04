import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/authentication/auth_response/auth_base_response.dart';
import 'package:exam_app_elevate/features/authentication/auth_response/user_dto.dart';
import 'package:exam_app_elevate/features/authentication/register/api/register_api.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';
import 'package:injectable/injectable.dart';
import '../../data/datasources/register_remote_data_source_contract.dart';

@Injectable(as: RegisterRemoteDataSourceContract)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSourceContract {
  final RegisterApi api;
  RegisterRemoteDataSourceImpl(this.api);

  @override
  Future<BaseResponse<AuthBaseResponse>> register(RegisterRequestModel request) async {
    try {
      final response = await api.register(request);
      return SuccessBaseResponse(data: response);
    } catch (e, s) {
      return ErrorBaseResponse(message: e.toString());
    }
  }
}
