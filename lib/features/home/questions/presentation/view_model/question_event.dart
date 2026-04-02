sealed class QuestionEvent {}

class GetQuestionEvent extends QuestionEvent {}

class NextPageEvent extends QuestionEvent {}

class PrevPageEvent extends QuestionEvent {}

class FinishExamEvent extends QuestionEvent {}

class AnswerSelectedEvent extends QuestionEvent {
  final int answerIndex;
  final String answer;

  AnswerSelectedEvent(this.answerIndex, this.answer);
}
