import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/subject/data/model/subject_response_model.dart';

abstract class SubjectRemoteDataSourcrContract {
  Future<BaseResponse<SubjectResponse>> getAllSubject();
}
