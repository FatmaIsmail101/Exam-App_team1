import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';

import '../../../../../config/base_response/base_response.dart';

abstract class QuestionRepoContract {
  Future<BaseResponse<List<QuestionEntity>>> getQuestions();
}
