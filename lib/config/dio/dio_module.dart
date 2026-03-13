import 'package:exam_app_elevate/core/values/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: AppEndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}
