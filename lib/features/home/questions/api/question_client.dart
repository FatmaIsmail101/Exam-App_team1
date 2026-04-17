import 'package:dio/dio.dart';
import 'package:exam_app_elevate/core/values/api_param.dart';
import 'package:exam_app_elevate/core/values/end_points.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/questions_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'question_client.g.dart';

@RestApi()
@injectable
abstract class QuestionClient {
  @factoryMethod
  factory QuestionClient(Dio dio) = _QuestionClient;

  @GET(AppEndPoints.addQuestionEndPoint)
  Future<QuestionsResponse> getAllQuestions(
    // @Query(ApiParam.exam) String id,
    @Header(ApiParam.token) String token,
  );
}
