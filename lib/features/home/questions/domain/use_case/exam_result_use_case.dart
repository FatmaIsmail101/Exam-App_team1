import 'package:exam_app_elevate/features/home/questions/domain/repository/question_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../data/model/exam_result.dart';

@injectable
class ExamResultUseCase {
  QuestionRepoContract repo;
  ExamResultUseCase(this.repo);
  Future<BaseResponse<ExamResult>> getAnswerCount(
    Map<int, int> userAnswers,
  ) async {
    return repo.getAnswerCount(userAnswers);
  }
}
