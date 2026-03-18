import 'package:exam_app_elevate/features/authentication/register/api/register_api.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_model.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';
import 'package:injectable/injectable.dart';
import '../../data/datasources/register_remote_data_source_contract.dart';

@Injectable(as: RegisterRemoteDataSourceContract)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSourceContract {
  final RegisterApi api;
  RegisterRemoteDataSourceImpl(this.api);

  @override
  Future<RegisterModel> register(RegisterRequestModel request) {
    return api.register(request);
  }
}