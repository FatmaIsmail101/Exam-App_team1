import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/features/authentication/entity/AuthEntity.dart';
import 'package:exam_app_elevate/features/authentication/register/peresenation/cubit/register_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../domain/use_case/register_usecase.dart';
import '../../data/models/register_request_model.dart';

// register_cubit.dart
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _useCase;

  RegisterCubit(this._useCase) : super(RegisterInitial());

  Future<void> register(RegisterRequestModel request) async {
    emit(RegisterLoading());

    final response = await _useCase.call(request);

    switch (response) {
      case SuccessBaseResponse<AuthEntity>():
      case ErrorBaseResponse<AuthEntity>():
        emit(RegisterError('Unknown error occurred', 0));
      case SuccessBaseResponse<AuthEntity>():
        // TODO: Handle this case.
        throw UnimplementedError();
      case ErrorBaseResponse<AuthEntity>():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
