import 'package:exam_app_elevate/config/base_state/base_state.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';

class QuestionState {
  BaseState<List<QuestionEntity>>? questionsState =
      BaseState<List<QuestionEntity>>(
        isLoading: false,
        data: null,
        errorMessage: null,
      );

  QuestionState({this.questionsState});

  static QuestionState init() {
    return QuestionState(
      questionsState: BaseState<List<QuestionEntity>>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
    );
  }

  QuestionState copyWith({BaseState<List<QuestionEntity>>? questionsState}) {
    return QuestionState(questionsState: questionsState ?? this.questionsState);
  }
}
