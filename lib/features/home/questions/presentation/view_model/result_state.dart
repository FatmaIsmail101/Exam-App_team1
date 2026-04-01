import 'package:exam_app_elevate/config/base_state/base_state.dart';

import '../../data/model/exam_result.dart';

class ResultState {
  BaseState<ExamResult>? examResultState = BaseState<ExamResult>(
    isLoading: true,
    data: null,
    errorMessage: null,
  );
  ResultState({this.examResultState});
  static ResultState init() {
    return ResultState(
      examResultState: BaseState<ExamResult>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
    );
  }

  ResultState copyWith({BaseState<ExamResult>? examResultState}) {
    return ResultState(
      examResultState: examResultState ?? this.examResultState,
    );
  }
}
