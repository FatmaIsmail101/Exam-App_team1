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
  QuestionEntity({
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    required this.question,
    required this.answersListResponse,
    required this.type,
    required this.isAnswered,
    required this.correctAnswerKey,
  });
}
