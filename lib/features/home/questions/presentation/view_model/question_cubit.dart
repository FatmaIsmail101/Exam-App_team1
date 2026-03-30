import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/questions/domain/use_case/question_usecase.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_event.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_state.dart';
import 'package:exam_app_elevate/main.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../data/model/exam_result.dart';
import '../../domain/entity/question_entity.dart';
import '../../domain/use_case/exam_result_use_case.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  Timer? _timer;
  final QuestionUsecase _usecase;
  final ExamResultUseCase _examResultUseCase;
  QuestionCubit(this._usecase, this._examResultUseCase)
    : super(QuestionState.init());
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
      case ExamResultEvent():
        _examResult();
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
    if (isClosed) return;

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
    bool wasAnsweredBefore = state.selectedAnswers.containsKey(index);
    // بنحدث الـ index بس من غير ما نغير حالة الـ questionsState
    emit(
      state.copyWith(
        currentIndex: index,
        answer: null, // بنصفر الاختيار للسؤال الجديد
        enabled: wasAnsweredBefore,
      ),
    );
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

  void _answerSelected(String selectedAnswer) {
    final updatedAnswers = Map<int, String>.from(state.selectedAnswers);
    updatedAnswers[state.currentIndex!] = selectedAnswer;
    emit(
      state.copyWith(
        enabled: true,
        answer: updatedAnswers,
        currentIndex: state.currentIndex,
      ),
    );
  }

  Future<void> _examResult() async {
    talker.warning("Current State Answers: ${state.selectedAnswers}");
    if (state.selectedAnswers.isEmpty) {
      talker.warning("Warning: selectedAnswers is EMPTY!");
    }
    emit(
      state.copyWith(
        examResultState: BaseState<ExamResult>(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );

    // final Map<int, int> convertedAnswers = state.selectedAnswers.map(
    //   (key, value) => MapEntry(key, int.parse(value)),
    // );
    //talker.warning("Converted Answers to send: $convertedAnswers");
    final response = await _examResultUseCase.getAnswerCount(
      state.selectedAnswers,
    );
    if (isClosed) return;
    switch (response) {
      case SuccessBaseResponse<ExamResult>():
        emit(
          state.copyWith(
            examResultState: BaseState<ExamResult>(
              isLoading: false,
              data: response.data,
              errorMessage: null,
            ),
          ),
        );
      case ErrorBaseResponse<ExamResult>():
        emit(
          state.copyWith(
            examResultState: BaseState<ExamResult>(
              isLoading: false,
              data: null,
              errorMessage: response.message,
            ),
          ),
        );
    }
  }
}
