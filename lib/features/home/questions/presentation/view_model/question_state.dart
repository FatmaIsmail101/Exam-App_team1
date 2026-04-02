import 'package:exam_app_elevate/config/base_state/base_state.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/exam_result.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';

class QuestionState {
  //Questions
  BaseState<List<QuestionEntity>> questionsState =
      BaseState<List<QuestionEntity>>(
        isLoading: false,
        data: null,
        errorMessage: null,
      );

  //PageIndex
  int currentIndexPage;

  QuestionState({
    BaseState<List<QuestionEntity>>? questionsState,
    this.currentIndexPage = 0,
  }) {
    this.questionsState = questionsState ?? this.questionsState;
  }

  static QuestionState init() {
    return QuestionState(
      questionsState: BaseState<List<QuestionEntity>>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
      currentIndexPage: 0,
    );
  }

  QuestionState copyWith({
    BaseState<List<QuestionEntity>>? questionsState,
    int? currentIndexPage,
    int? time,
    Map<int, String>? answer,
    bool? enabled,
    BaseState<ExamResult>? examResultState,
  }) {
    return QuestionState(
      questionsState: questionsState ?? this.questionsState,
      currentIndexPage: currentIndexPage ?? this.currentIndexPage,
    );
  }
}
