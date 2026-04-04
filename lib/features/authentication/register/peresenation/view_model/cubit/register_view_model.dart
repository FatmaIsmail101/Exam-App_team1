import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/config/base_state/base_state.dart';
import 'package:exam_app_elevate/features/authentication/entity/AuthEntity.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';
import 'package:exam_app_elevate/features/authentication/register/domain/use_case/register_usecase.dart';
import 'package:exam_app_elevate/features/authentication/register/peresenation/view_model/state/register_event.dart';
import 'package:exam_app_elevate/features/authentication/register/peresenation/view_model/state/register_state.dart';
import 'package:injectable/injectable.dart';



// register_view_model.dart
@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  final RegisterUseCase _useCase;

  RegisterViewModel(this._useCase) : super(RegisterState.initial());

void doIntent(RegisterEvent event){
  switch(event){
    case RegisterWithEmailAndPasswordEvent():
      _register(event.requestModel);
      break;
    case RegisterWithGoogleEvent():
      //TODO Register with google

  }
}


  Future<void> _register(RegisterRequestModel request) async {
    emit(
      state.copyWith(
        registerState: BaseState<AuthEntity>(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );

    final response = await _useCase.call(request);

    switch (response) {
      case SuccessBaseResponse<AuthEntity>():
        emit(
          state.copyWith(
            registerState: BaseState<AuthEntity>(
              isLoading: false,
              data: response.data,
              errorMessage: null,
            ),
          ),
        );
      case ErrorBaseResponse<AuthEntity>():
        emit(
          state.copyWith(
            registerState: BaseState<AuthEntity>(
              isLoading: false,
              data: null,
              errorMessage: response.message,
            ),
          ),
        );
    }
  }
}
