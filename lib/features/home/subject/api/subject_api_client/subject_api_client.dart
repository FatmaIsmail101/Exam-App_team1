import 'package:dio/dio.dart';
import 'package:exam_app_elevate/core/values/api_param.dart';
import 'package:exam_app_elevate/core/values/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../data/model/subject_response_model.dart';

part 'subject_api_client.g.dart';

@RestApi()
@injectable
abstract class SubjectApiClient {
  @factoryMethod
  factory SubjectApiClient(Dio dio) = _SubjectApiClient;

  @GET(AppEndPoints.getAllSubject)
  Future<SubjectResponse> getAllSubject(
      @Header(ApiParam.token) String token,
      );
}