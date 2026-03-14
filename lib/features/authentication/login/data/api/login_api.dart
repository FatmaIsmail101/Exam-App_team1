import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../../core/values/end_points.dart';
import '../models/login_model.dart';

part 'login_api.g.dart';

@injectable
@RestApi()
abstract class LoginApi {

  @factoryMethod
  factory LoginApi(Dio dio) = _LoginApi;

  @POST(AppEndPoints.signInEndpoint)
  Future<LoginModel> login(
      @Body() Map<String, dynamic> body,
      );
}