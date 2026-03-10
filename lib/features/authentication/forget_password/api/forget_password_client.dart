import 'package:dio/dio.dart';
import 'package:exam_app_elevate/core/values/end_points.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/data/models/forget_password/forget_password_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../data/models/forget_password/forget_password_request.dart';

part 'forget_password_client.g.dart';

@RestApi()
@injectable
abstract class ForgetPasswordClient {
  @factoryMethod
  factory ForgetPasswordClient(Dio dio) = _ForgetPasswordClient;
  @POST(AppEndPoints.forgetPasswordEndpoint)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequest request,
  );
}
