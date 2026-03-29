import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/questions/data/data_source/questions_data_source_contract.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/questions_response.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';
import 'package:exam_app_elevate/features/home/questions/domain/repository/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/caching/caching_helper.dart';
import '../../../../../config/caching/hive_keys.dart';
import '../../../../../config/di/di.dart';
import '../model/exam_result.dart';

@Injectable(as: QuestionRepoContract)
class QuestionRepoImpl implements QuestionRepoContract {
  final QuestionsDataSourceContract dataSource;
  QuestionRepoImpl(this.dataSource);
  @override
  Future<BaseResponse<List<QuestionEntity>>> getQuestions(String id) async {
    final response = await dataSource.getAllQuestions(id);
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

  @override
  Future<BaseResponse<ExamResult>> getAnswerCount(
    Map<int, int> userAnswers,
  ) async {
    try {
      int wrongCounter = 0;
      int correctCounter = 0;

      // 1. هات الأسئلة كلها من الكاش
      final cachedData = getIt<CachingHelper>().getData<QuestionsResponse>(
        HiveKeys.questionsKey,
      );
      final questions = cachedData?.questionsListResponse ?? [];
      userAnswers.forEach((questionIndex, selectedAnswerKey) {
        final correctAnswer = questions[questionIndex].correct;

        if (selectedAnswerKey == correctAnswer) {
          correctCounter++;
        } else {
          wrongCounter++;
        }
      });
      return SuccessBaseResponse<ExamResult>(
        data: ExamResult(
          wrongCounter: wrongCounter,
          correctCounter: correctCounter,
        ),
      );
    } catch (e) {
      return ErrorBaseResponse<ExamResult>(message: e.toString());
    }
  }
}
