import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/questions/domain/repository/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../entity/question_entity.dart';

@injectable
class QuestionUsecase {
  QuestionRepoContract repo;

  QuestionUsecase(this.repo);

  Future<BaseResponse<List<QuestionEntity>>> getQuestions() async {
    return repo.getQuestions();
  }
}
