sealed class QuestionEvent {}

class getQuestionEvent extends QuestionEvent {
  final String id;
  getQuestionEvent(this.id);
}

class ChangePageEvent extends QuestionEvent {
  final int newIndex;
  ChangePageEvent(this.newIndex);
}

class ChangeTimeEvent extends QuestionEvent {
  final int duration;
  ChangeTimeEvent(this.duration);
}

class ViewScore extends QuestionEvent {}

class AnswerSelectedEvent extends QuestionEvent {
  final String answerIndex;
  AnswerSelectedEvent(this.answerIndex);
}

class ExamResultEvent extends QuestionEvent {}
