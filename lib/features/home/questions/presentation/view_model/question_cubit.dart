import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/questions/domain/use_case/question_usecase.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_event.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../../../config/secure/flutter_secure_storage.dart';
import '../../../../../core/values/secure_storage_keys.dart';
import '../../domain/entity/question_entity.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  DateTime? _timer;
  QuestionUsecase _usecase;
  QuestionCubit(this._usecase) : super(QuestionState.init());
  void doIntent(QuestionEvent event) {
    switch (event) {
      case getQuestionEvent():
        _getQuestions(event.id);
        break;
    }
  }

  Future<void> _getQuestions(String id) async {
    emit(
      state.copyWith(
        questionsState: BaseState<List<QuestionEntity>>(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );
    String? token = await CashingFlutterSecureStorage.get(
      SecureStorageKeys.token,
    );

    if (token == null) {
      emit(
        state.copyWith(
          questionsState: BaseState(
            isLoading: false,
            errorMessage: "User not authenticated",
          ),
        ),
      );
      return;
    }
    final response = await _usecase.getQuestions(id);

    switch (response) {
      case SuccessBaseResponse<List<QuestionEntity>>():
        emit(
          state.copyWith(
            questionsState: BaseState<List<QuestionEntity>>(
              isLoading: false,
              data: response.data,
              errorMessage: null,
            ),
          ),
        );
        final sec = response.data?.first.duration ?? 0 ~/ 60;
        _timer?.add(
          Duration(minutes: response.data?.first.duration ?? 0, seconds: sec),
        );
      case ErrorBaseResponse<List<QuestionEntity>>():
        emit(
          state.copyWith(
            questionsState: BaseState<List<QuestionEntity>>(
              isLoading: false,
              data: null,
              errorMessage: response.message,
            ),
          ),
        );
    }
  }
}
