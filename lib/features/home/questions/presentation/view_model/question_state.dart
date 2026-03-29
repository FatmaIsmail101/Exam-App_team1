import 'package:exam_app_elevate/config/base_state/base_state.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/exam_result.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';

class QuestionState {
  //Questions
  BaseState<List<QuestionEntity>>? questionsState =
      BaseState<List<QuestionEntity>>(
        isLoading: false,
        data: null,
        errorMessage: null,
      );
  //PageIndex
  int? currentIndex;
  //Timer
  int? time;
  BaseState<ExamResult>? examResultState = BaseState<ExamResult>(
    isLoading: true,
    data: null,
    errorMessage: null,
  );
  final Map<int, String> selectedAnswers;
  bool? isButtonEnabled; //مشتقة من selectedAnswer
  QuestionState({
    this.examResultState,
    this.questionsState,
    this.currentIndex = 0,
    this.time,
    this.selectedAnswers = const {},
    this.isButtonEnabled = false,
  });

  static QuestionState init() {
    return QuestionState(
      questionsState: BaseState<List<QuestionEntity>>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
      currentIndex: 0,
      selectedAnswers: {},
      isButtonEnabled: false,
      time: 0,
      examResultState: BaseState<ExamResult>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
    );
  }

  QuestionState copyWith({
    BaseState<List<QuestionEntity>>? questionsState,
    int? currentIndex,
    int? time,
    Map<int, String>? answer,
    bool? enabled,
    BaseState<ExamResult>? examResultState,
  }) {
    return QuestionState(
      questionsState: questionsState ?? this.questionsState,
      currentIndex: currentIndex ?? this.currentIndex,
      time: time ?? this.time,
      selectedAnswers: answer ?? selectedAnswers,
      isButtonEnabled: enabled ?? isButtonEnabled,
      examResultState: examResultState ?? this.examResultState,
    );
  }
}
