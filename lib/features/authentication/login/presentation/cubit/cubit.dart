import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../../../core/network/storage/secure_storage_service.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import 'state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repository;
  final SecureStorageService _storageService;

  LoginCubit(this._repository, this._storageService)
      : super( LoginState());

  Future<void> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    emit(state.copyWith(isLoading: true));

    final response = await _repository.login(email: email, password: password);

    switch (response) {
      case SuccessBaseResponse<LoginEntity>():
        if (rememberMe) {
          await _storageService.writeToken(response.data!.token);
        }
        await _storageService.writeRememberMe(rememberMe);
        emit(state.copyWith(isLoading: false, data: response.data));

      case ErrorBaseResponse<LoginEntity>():
        emit(state.copyWith(
          isLoading: false,
          errorMessage: response.displayMessage,
        ));
    }
  }
}