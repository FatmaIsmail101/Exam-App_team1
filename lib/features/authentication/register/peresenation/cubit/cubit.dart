import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/features/authentication/login/domain/entity/login_entity.dart';
import 'package:exam_app_elevate/features/authentication/register/peresenation/cubit/state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../../../core/network/storage/secure_storage_service.dart';
import '../../domain/use_case/register_usecase.dart';
import '../../data/models/register_request_model.dart';

// cubit.dart
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _useCase;

  RegisterCubit(this._useCase) : super(RegisterInitial());

  Future<void> register(RegisterRequestModel request) async {
    emit(RegisterLoading());


    final response = await _useCase.call(request);

    switch (response) {
      case SuccessBaseResponse<LoginEntity>():
        // حفظ الـ token
        await SecureStorageService().writeToken(response.data!.token);
        emit(RegisterSuccess(response.data!));

      case ErrorBaseResponse<LoginEntity>():
        final code = response.code ?? 0;
        final message = switch (code) {
          400 => 'Bad request',
          409 => 'User already exists',
          500 => 'Server error, please try again later',
          _ => response.message ?? 'Unknown error occurred',
        };
        emit(RegisterError(message, code));
    }
  }
}
