import 'package:dio/dio.dart';
import 'package:exam_app_elevate/core/values/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/network/storage/secure_storage_service.dart';

@module
abstract class DioModule {
  @singleton
  Dio dio(SecureStorageService storage) => Dio(
    BaseOptions(
      baseUrl: AppEndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.addAll([
    PrettyDioLogger(requestBody: true, responseBody: true),
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await storage.readToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ),
  ]);
}