import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../data/model/exam_result.dart';

abstract class QuestionRepoContract {
  Future<BaseResponse<List<QuestionEntity>>> getQuestions(String id);
  Future<BaseResponse<ExamResult>> getAnswerCount(Map<int, String> userAnswers);
}
