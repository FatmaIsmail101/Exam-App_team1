import 'dart:convert';

import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/questions/data/data_source/questions_data_source_contract.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/questions_response.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';
import 'package:exam_app_elevate/features/home/questions/domain/repository/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/caching/caching_helper.dart';
import '../../../../../config/caching/caching_keys.dart';
import '../../../../../main.dart';
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
    Map<int, String> userAnswers,
  ) async {
    try {
      int wrongCounter = 0;
      int correctCounter = 0;

      // 1. هات الـ String من الكاش
      final String? cachedData = CachingHelper.getString(
        CachingKeys.questionsKey,
      );

      if (cachedData == null) {
        return ErrorBaseResponse(message: "No cached data found");
      }

      // 2. حول الـ String لـ Map وبعدين لـ Object
      final Map<String, dynamic> jsonData = jsonDecode(cachedData);
      final questionsResponse = QuestionsResponse.fromJson(
        jsonData,
      ); // ✅ التحويل
      final questions = questionsResponse.questionsListResponse ?? [];
      userAnswers.forEach((questionIndex, selectedAnswerKey) {
        final correctAnswer = questions[questionIndex].correct;
        talker.warning(
          "Check Q$questionIndex: Selected($selectedAnswerKey) [Type: ${selectedAnswerKey.runtimeType}] | Correct($correctAnswer) [Type: ${correctAnswer.runtimeType}]",
        );
        if (selectedAnswerKey.toString() == correctAnswer.toString()) {
          correctCounter++;
        } else {
          wrongCounter++;
        }
      });
      talker.warning("Correct: $correctCounter, Wrong: $wrongCounter");
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
