import 'package:exam_app_elevate/features/authentication/register/api/register_api.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_model.dart';
import 'package:exam_app_elevate/features/authentication/register/data/models/register_request_model.dart';
import 'package:injectable/injectable.dart';

abstract class RegisterRemoteDataSourceContract {
  Future<RegisterModel> register(RegisterRequestModel request);
}


