
import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/subject/data/model/subject_response_model.dart';
import 'package:exam_app_elevate/features/home/subject/domain/subject_entity/subject_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/subject_repo_contract/subject_repo_contract.dart';
import '../subject_data_source_impl/subject_data_source_impl.dart';
import '../subject_data_source_impl/subject_remote_data_sourcr_contract.dart';

@Injectable(as: SubjectRepoContract)
class SubjectRepoImpl implements SubjectRepoContract{
  SubjectRepoImpl(this.subjectRemoteDataSource);
  final SubjectRemoteDataSourcrContract subjectRemoteDataSource;
  @override
  Future<BaseResponse<List<SubjectEntity>>> getsubject() async {
    final response= await subjectRemoteDataSource.getAllSubject();
    switch(response){

      case SuccessBaseResponse<SubjectResponse>():
        return SuccessBaseResponse<List<SubjectEntity>>(
          data: response.data?.toDomain() ?? [],
        );

      case ErrorBaseResponse<SubjectResponse>():
        return ErrorBaseResponse<List<SubjectEntity>>(
          message: response.message,
          code: response.code,
        );
    }

    // });
  }


}