import 'package:dio/dio.dart';
import 'package:exam_app_elevate/core/values/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: AppEndPoints.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  )..interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true));
}
