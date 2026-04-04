

import 'package:exam_app_elevate/features/authentication/auth_response/auth_base_response.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../../core/values/end_points.dart';

part 'register_api.g.dart';

@injectable
@RestApi()
abstract class RegisterApi {

  @factoryMethod
  factory RegisterApi(Dio dio) = _RegisterApi;

  @POST(AppEndPoints.signUpEndpoint)
  Future<AuthBaseResponse> register(
      @Body() RegisterRequestModel request,
      );
}