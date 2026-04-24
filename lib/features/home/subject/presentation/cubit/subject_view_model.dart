import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/features/home/subject/presentation/cubit/subject_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_response/base_response.dart';
import '../../domain/subject_entity/subject_entity.dart';
import '../../domain/subject_usecase.dart';

@injectable
class SubjectViewModel extends Cubit<SubjectState> {
  SubjectViewModel(this.subjectUseCase) : super(SubjectInitialState());

  final SubjectUsecase subjectUseCase;
  List<SubjectEntity> _allSubjects = []; // ← private أحسن

  Future<void> getSubject() async {
    emit(SubjectLoadingState());

    final response = await subjectUseCase();

    switch (response) {
      case SuccessBaseResponse<List<SubjectEntity>>():
        _allSubjects = response.data ?? []; // ← ✅ احفظها هنا
        emit(SubjectsuccessState(_allSubjects));
        break;

      case ErrorBaseResponse<List<SubjectEntity>>():
        emit(SubjectErrorState(response.message ?? "Error"));
        break;
    }
  }

  void searchSubjects(String query) {
    if (query.trim().isEmpty) {
      emit(SubjectsuccessState(_allSubjects)); // ← دلوقتي هترجع الكل صح
      return;
    }
    final filtered = _allSubjects.where((subject) {
      return subject.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
    }).toList();
    emit(SubjectsuccessState(filtered));
  }
}