import 'package:exam_app_elevate/features/authentication/register/api/register_api.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_model.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';
import 'package:injectable/injectable.dart';

abstract class RegisterRemoteDataSource {
  Future<RegisterModel> register(RegisterRequestModel request);
}

@Injectable(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final RegisterApi api;
  RegisterRemoteDataSourceImpl(this.api);

  @override
  Future<RegisterModel> register(RegisterRequestModel request) {
    return api.register(request);
  }
}
