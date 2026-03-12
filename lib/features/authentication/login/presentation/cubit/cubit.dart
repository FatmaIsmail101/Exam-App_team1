import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/features/authentication/login/presentation/cubit/state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/repositories/login_repository.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repository;

  LoginCubit(this._repository) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final response = await _repository.login(email: email, password: password);

      if (response is SuccessBaseResponse<LoginEntity>) {
        emit(LoginSuccess(response.data!)); // ✅ نستخدم !
      } else if (response is ErrorBaseResponse<LoginEntity>) {
        emit(LoginError(response.message ?? "Unknown error"));
      } else {
        emit(const LoginError("Unknown error occurred"));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}