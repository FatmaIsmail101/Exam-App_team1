import 'package:injectable/injectable.dart';


import '../../../../../config/base_response/base_response.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_datasource.dart';

@Injectable(as: LoginRepository)
class AuthRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<BaseResponse<LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final loginModel = await remoteDataSource.login(email, password);

      return SuccessBaseResponse(
        message: "success",
        data: loginModel.toEntity(),
      );
    } catch (e) {
      return ErrorBaseResponse(
        message: e.toString(),
        code: 500,
      );
    }
  }
}