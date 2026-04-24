
import '../../../../../config/base_response/base_response.dart';
import '../subject_entity/subject_entity.dart';

abstract class SubjectRepoContract {
  Future<BaseResponse<List<SubjectEntity>>> getsubject();
}