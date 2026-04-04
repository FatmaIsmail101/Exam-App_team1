import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/features/authentication/login/presentation/cubit/state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../../../core/network/storage/secure_storage_service.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/repositories/login_repository.dart';

// cubit.dart
@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repository;

  LoginCubit(this._repository) : super(LoginInitial());
  Future<void> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    emit(LoginLoading());

    final response = await _repository.login(email: email, password: password);

    switch (response) {
      case SuccessBaseResponse<LoginEntity>():
      // حفظ الـ token لو المستخدم فعل Remember Me
        if (rememberMe) {
          await SecureStorageService().writeToken(response.data!.token);
        }
        emit(LoginSuccess(response.data!));

      case ErrorBaseResponse<LoginEntity>():
        final code = response.code ?? 0;
        final message = switch (code) {
          401 => 'incorrect email or password',
          403 => 'You are not authorized',
          404 => 'Account not found',
          500 => 'Server error, please try again later',
          _   => response.message ?? 'Unknown error occurred',
        };
        emit(LoginError(message, code));
    }
  }
}