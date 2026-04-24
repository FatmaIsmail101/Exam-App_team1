import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/subject/domain/subject_entity/subject_entity.dart';
import 'package:exam_app_elevate/features/home/subject/domain/subject_repo_contract/subject_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectUsecase {
  final SubjectRepoContract repo;

  SubjectUsecase(this.repo);

  Future<BaseResponse<List<SubjectEntity>>> call() {
    return repo.getsubject();
  }
}