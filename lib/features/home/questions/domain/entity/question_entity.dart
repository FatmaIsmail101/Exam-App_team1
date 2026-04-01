import 'package:exam_app_elevate/features/home/questions/data/model/question_types.dart';

import '../../data/model/answers_list_response.dart';

class QuestionEntity {
  List<AnswersListResponse> answersListResponse;
  QuestionTypes type;
  bool isAnswered;
  String correctAnswerKey;
  String question;
  int duration;
  int numberOfQuestions;
  String title;
  String selectedAnswerKey;
  int? correctAnswer;
  int? wrongAnswer;
  QuestionEntity({
    this.correctAnswer,
    this.wrongAnswer,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    required this.question,
    required this.answersListResponse,
    required this.type,
    required this.isAnswered,
    required this.correctAnswerKey,
    required this.selectedAnswerKey,
  });
  QuestionEntity copyWith({
    String? selectedAnswerKey,
    bool? isAnswered,
    String? question,
    String? correctAnswerKey,
    int? correctAnswer,
    int? wrongAnswer,
    List<AnswersListResponse>? answersListResponse,
    QuestionTypes? type,
    int? duration,
    int? numberOfQuestions,
    String? title,
  }) {
    return QuestionEntity(
      correctAnswer: correctAnswer ?? this.correctAnswer,
      wrongAnswer: wrongAnswer ?? this.wrongAnswer,
      question: this.question,
      selectedAnswerKey: selectedAnswerKey ?? this.selectedAnswerKey,
      isAnswered: isAnswered ?? this.isAnswered,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      answersListResponse: answersListResponse ?? this.answersListResponse,
      type: type ?? this.type,
      correctAnswerKey: correctAnswerKey ?? this.correctAnswerKey,
      // ... باقي الحقول تنزليها زي ما هي
    );
  }
}
