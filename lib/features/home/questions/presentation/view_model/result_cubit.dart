import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/result_event.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/result_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../../../../config/base_state/base_state.dart';
import '../../data/model/exam_result.dart';
import '../../domain/use_case/exam_result_use_case.dart';

@injectable
class ResultCubit extends Cubit<ResultState> {
  final ExamResultUseCase _usecase;
  ResultCubit(this._usecase) : super(ResultState.init());

  void doIntent(ResultEvent event) {
    switch (event) {
      case ShowResultEvent():
        _getResults(event.answers);
        break;
    }
  }

  Future<void> _getResults(Map<int, String> answers) async {
    emit(
      state.copyWith(
        examResultState: BaseState<ExamResult>(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );

    final response = await _usecase.getAnswerCount(answers);
    if (isClosed) return;
    switch (response) {
      case SuccessBaseResponse<ExamResult>():
        emit(
          state.copyWith(
            examResultState: BaseState<ExamResult>(
              isLoading: false,
              data: response.data,
              errorMessage: null,
            ),
          ),
        );
      case ErrorBaseResponse<ExamResult>():
        emit(
          state.copyWith(
            examResultState: BaseState<ExamResult>(
              isLoading: false,
              data: null,
              errorMessage: response.message,
            ),
          ),
        );
    }
  }
}
