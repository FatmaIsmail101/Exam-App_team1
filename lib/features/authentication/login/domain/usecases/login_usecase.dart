import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../entity/login_entity.dart';
import '../repositories/login_repository.dart';

@injectable
class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<BaseResponse<LoginEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.login(
      email: email,
      password: password,
    );
  }
}