import '../../data/model/answers_list_response.dart';

class QuestionEntity {
  List<AnswersListResponse> answersListResponse;
  String type;

  String correctAnswerKey;
  String question;
  String title;
  String userAnswer;
  int? correctAnswer;
  int? wrongAnswer;

  QuestionEntity({
    this.correctAnswer,
    this.wrongAnswer,
    required this.title,
    required this.question,
    required this.answersListResponse,
    required this.type,
    required this.userAnswer,
    required this.correctAnswerKey,
  });

  QuestionEntity copyWith({
    String? userAnswer,
    String? question,
    String? correctAnswerKey,
    int? correctAnswer,
    int? wrongAnswer,
    List<AnswersListResponse>? answersListResponse,
    String? type,
    String? title,
  }) {
    return QuestionEntity(
      correctAnswer: correctAnswer ?? this.correctAnswer,
      wrongAnswer: wrongAnswer ?? this.wrongAnswer,
      question: this.question,
      userAnswer: userAnswer ?? this.userAnswer,
      title: title ?? this.title,
      answersListResponse: answersListResponse ?? this.answersListResponse,
      type: type ?? this.type,
      correctAnswerKey: correctAnswerKey ?? this.correctAnswerKey,
    );
  }
}
