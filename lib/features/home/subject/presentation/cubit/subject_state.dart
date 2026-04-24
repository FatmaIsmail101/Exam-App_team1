
import '../../domain/subject_entity/subject_entity.dart';

sealed class SubjectState {}
class SubjectInitialState extends SubjectState {}
class SubjectLoadingState extends SubjectState {}
class SubjectsuccessState extends SubjectState {
  final List<SubjectEntity> subject;
  SubjectsuccessState( this.subject);
}
class SubjectErrorState extends SubjectState {
  final String errorMessage;
  SubjectErrorState(this.errorMessage);
}