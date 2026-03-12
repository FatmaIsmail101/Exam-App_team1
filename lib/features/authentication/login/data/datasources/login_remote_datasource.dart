import '../api/login_api.dart';
import '../models/login_model.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> login(String email, String password);
}

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final LoginApi api;

  LoginRemoteDataSourceImpl(this.api);

  @override
  Future<LoginModel> login(String email, String password) {
    return api.login({
      "email": email,
      "password": password,
    });
  }
}