import 'package:exam_app_elevate/config/base_state/base_state.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_state.g.dart';

@JsonSerializable()
class QuestionState {
  //Questions
  @JsonKey(includeFromJson: false, includeToJson: false)
  BaseState<List<QuestionEntity>> questionsState =
      BaseState<List<QuestionEntity>>(
        isLoading: false,
        data: null,
        errorMessage: null,
      );
  //for caching
  final List<QuestionEntity>? cachedQuestions;

  //PageIndex
  int currentIndexPage;

  QuestionState({
    this.cachedQuestions,
    BaseState<List<QuestionEntity>>? questionsState,
    this.currentIndexPage = 0,
  }) {
    this.questionsState = questionsState ?? this.questionsState;
  }

  static QuestionState init() {
    return QuestionState(
      cachedQuestions: null,
      questionsState: BaseState<List<QuestionEntity>>(
        isLoading: true,
        data: null,
        errorMessage: null,
      ),
      currentIndexPage: 0,
    );
  }

  QuestionState copyWith({
    List<QuestionEntity>? cachedQuestions,
    BaseState<List<QuestionEntity>>? questionsState,
    int? currentIndexPage,
  }) {
    return QuestionState(
      cachedQuestions:
          cachedQuestions ?? questionsState?.data ?? this.cachedQuestions,
      questionsState: questionsState ?? this.questionsState,
      currentIndexPage: currentIndexPage ?? this.currentIndexPage,
    );
  }

  factory QuestionState.fromJson(Map<String, dynamic> json) =>
      _$QuestionStateFromJson(json);

  // Generated toJson
  Map<String, dynamic> toJson() => _$QuestionStateToJson(this);
}
