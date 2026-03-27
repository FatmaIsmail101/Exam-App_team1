import 'package:exam_app_elevate/config/base_state/base_state.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';

class QuestionState {
  BaseState<List<QuestionEntity>>? questionsState =
      BaseState<List<QuestionEntity>>(
        isLoading: false,
        data: null,
        errorMessage: null,
      );
  int? currentIndex;
  int? time;
  QuestionState({this.questionsState, this.currentIndex = 0, this.time});

  static QuestionState init() {
    return QuestionState(
      questionsState: BaseState<List<QuestionEntity>>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
      currentIndex: 0,
      time: 0,
    );
  }

  QuestionState copyWith({
    BaseState<List<QuestionEntity>>? questionsState,
    int? currentIndex,
    int? time,
  }) {
    return QuestionState(
      questionsState: questionsState ?? this.questionsState,
      currentIndex: currentIndex ?? this.currentIndex,
      time: time ?? this.time,
    );
  }
}
