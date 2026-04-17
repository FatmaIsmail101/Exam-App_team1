import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/questions/data/data_source/questions_data_source_contract.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/questions_response.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';
import 'package:exam_app_elevate/features/home/questions/domain/repository/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionRepoContract)
class QuestionRepoImpl implements QuestionRepoContract {
  final QuestionsDataSourceContract dataSource;

  QuestionRepoImpl(this.dataSource);

  @override
  Future<BaseResponse<List<QuestionEntity>>> getQuestions() async {
    final response = await dataSource.getAllQuestions();
    switch (response) {
      case SuccessBaseResponse<QuestionsResponse>():
        return SuccessBaseResponse<List<QuestionEntity>>(
          data: response.data?.toDomain(),
        );

      case ErrorBaseResponse<QuestionsResponse>():
        return ErrorBaseResponse<List<QuestionEntity>>(
          message: response.message,
          code: response.code,
        );
    }
  }
}
