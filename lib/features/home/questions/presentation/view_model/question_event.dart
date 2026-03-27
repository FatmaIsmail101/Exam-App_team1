sealed class QuestionEvent {}

class getQuestionEvent extends QuestionEvent {
  final String id;
  getQuestionEvent(this.id);
}
