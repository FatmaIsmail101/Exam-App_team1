import 'package:exam_app_elevate/features/home/questions/data/model/question_types.dart';

import '../../data/model/answers_list_response.dart';

class QuestionEntity {
  List<AnswersListResponse> answersListResponse;
  QuestionTypes type;
  bool isAnswered;
  String correctAnswerKey;
  String question;
  QuestionEntity({
    required this.question,
    required this.answersListResponse,
    required this.type,
    required this.isAnswered,
    required this.correctAnswerKey,
  });
}
