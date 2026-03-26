import 'package:dio/dio.dart';
import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/questions/data/data_source/questions_data_source_contract.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/questions_response.dart';
import 'package:injectable/injectable.dart';

import '../../api/question_client.dart';

@Injectable(as: QuestionsDataSourceContract)
class QuestionDataSourceImpl implements QuestionsDataSourceContract {
  QuestionClient questionClient;
  QuestionDataSourceImpl(this.questionClient);
  @override
  Future<BaseResponse<QuestionsResponse>> getAllQuestions(String id) async {
    try {
      final response = await questionClient.getAllQuestions(id);
      return SuccessBaseResponse(data: response);
    } on DioException catch (e) {
      return ErrorBaseResponse(
        message: e.message,
        code: e.response?.statusCode ?? 0,
      );
    }
  }
}
