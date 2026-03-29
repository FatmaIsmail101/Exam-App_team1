import 'dart:async';

import 'package:dio/dio.dart';
import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/config/caching/hive_keys.dart';
import 'package:exam_app_elevate/config/di/di.dart';
import 'package:exam_app_elevate/config/secure/flutter_secure_storage.dart';
import 'package:exam_app_elevate/core/values/secure_storage_keys.dart';
import 'package:exam_app_elevate/features/home/questions/data/data_source/questions_data_source_contract.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/questions_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/caching/caching_helper.dart';
import '../../../../../core/values/app_strings.dart';
import '../../api/question_client.dart';

@Injectable(as: QuestionsDataSourceContract)
class QuestionDataSourceImpl implements QuestionsDataSourceContract {
  QuestionClient questionClient;

  QuestionDataSourceImpl(this.questionClient);

  @override
  Future<BaseResponse<QuestionsResponse>> getAllQuestions(String id) async {
    try {
      final token = await CashingFlutterSecureStorage.get(
        SecureStorageKeys.token,
      );
      final response = await questionClient.getAllQuestions(id, token ?? "");
      getIt.get<CachingHelper>().saveData<QuestionsResponse>(
        HiveKeys.questionsKey,
        response,
      );
      return SuccessBaseResponse(data: response);
    } on DioException catch (e) {
      return ErrorBaseResponse(
        message: e.message,
        code: e.response?.statusCode ?? 0,
      );
    } on TimeoutException {
      return ErrorBaseResponse(message: AppStrings.timeOutException);
    }
  }
}
