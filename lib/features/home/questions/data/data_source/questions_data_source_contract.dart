import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/questions_response.dart';

abstract class QuestionsDataSourceContract {
  Future<BaseResponse<QuestionsResponse>> getAllQuestions();
}
