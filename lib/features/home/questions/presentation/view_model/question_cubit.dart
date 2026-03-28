import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/questions/domain/use_case/question_usecase.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_event.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../domain/entity/question_entity.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  Timer? _timer;
  final QuestionUsecase _usecase;
  QuestionCubit(this._usecase) : super(QuestionState.init());
  void doIntent(QuestionEvent event) {
    switch (event) {
      case getQuestionEvent():
        _getQuestions(event.id);
        break;
      case ChangePageEvent():
        _changePage(event.newIndex);
        break;
      case ChangeTimeEvent():
        _startTimer(event.duration);
        break;
      case ViewScore():
        _close();
        break;
      case AnswerSelectedEvent():
        _answerSelected(event.answerIndex);
        break;
    }
  }

  Future<void> _getQuestions(String id) async {
    emit(
      state.copyWith(
        questionsState: BaseState<List<QuestionEntity>>(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
        currentIndex: 0,
      ),
    );

    final response = await _usecase.getQuestions(id);

    switch (response) {
      case SuccessBaseResponse<List<QuestionEntity>>():
        emit(
          state.copyWith(
            questionsState: BaseState<List<QuestionEntity>>(
              isLoading: false,
              data: response.data,
              errorMessage: null,
            ),
            currentIndex: 0,
          ),
        );
        _startTimer(response.data?.first.duration ?? 0);

        break;

      case ErrorBaseResponse<List<QuestionEntity>>():
        emit(
          state.copyWith(
            currentIndex: 0,
            questionsState: BaseState<List<QuestionEntity>>(
              isLoading: false,
              data: null,
              errorMessage: response.message,
            ),
          ),
        );
    }
  }

  void _changePage(int index) {
    // بنحدث الـ index بس من غير ما نغير حالة الـ questionsState
    emit(state.copyWith(currentIndex: index));
  }

  void _startTimer(int minutes) {
    _timer?.cancel(); // بنلغي أي تايمر قديم لو موجود

    int totalSeconds = minutes * 60; // تحويل الدقائق لثواني
    emit(state.copyWith(time: totalSeconds));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.time! > 0) {
        emit(state.copyWith(time: (state.time ?? 0) - 1));
      } else {
        _timer?.cancel();
        // هنا ممكن تبعتي Intent إن الوقت خلص عشان تظهري Alert للمستخدم
      }
    });
  }

  // عند قفل الشاشة لازم نمسح التايمر عشان ميفضلش شغال في الميموري
  @override
  Future<void> _close() {
    _timer?.cancel();
    return super.close();
  }

  void _answerSelected(String answerKey) {
    if (state.questionsState?.data == null) return;

    final index = state.currentIndex ?? 0;
    final updatedQuestions = List<QuestionEntity>.from(
      state.questionsState!.data!,
    );

    // تحديث السؤال الحالي فقط
    updatedQuestions[index] = updatedQuestions[index].copyWith(
      // تأكدي إن الحقول دي موجودة في الـ QuestionEntity copyWith
      selectedAnswerKey: answerKey,
      isAnswered: true,
    );

    emit(
      state.copyWith(
        questionsState: state.questionsState!.copyWith(data: updatedQuestions),
      ),
    );
  }
}
