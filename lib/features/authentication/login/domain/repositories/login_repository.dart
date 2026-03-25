import '../../../../../config/base_response/base_response.dart';
import '../entity/login_entity.dart';

abstract class LoginRepository {
  Future<BaseResponse<LoginEntity>> login({
    required String email,
    required String password,
  });
}