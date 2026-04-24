
import 'dart:async';
import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/subject/data/model/subject_response_model.dart';
import 'package:exam_app_elevate/features/home/subject/data/subject_data_source_impl/subject_remote_data_sourcr_contract.dart';
import 'package:injectable/injectable.dart';
import '../../../../../config/secure/flutter_secure_storage.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../../core/values/secure_storage_keys.dart';
import 'package:dio/dio.dart';
import '../../api/subject_api_client/subject_api_client.dart';

@Injectable(as: SubjectRemoteDataSourcrContract)
class SubjectDataSourceImpl implements SubjectRemoteDataSourcrContract {
  SubjectApiClient subjectApiClient;

  SubjectDataSourceImpl(this.subjectApiClient);
  @override
  Future<BaseResponse<SubjectResponse>> getAllSubject() async {
    try {
      final token = await CashingFlutterSecureStorage.get(
        SecureStorageKeys.token,
      );
      final response = await subjectApiClient.getAllSubject(token ?? "");
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
