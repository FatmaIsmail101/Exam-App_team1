import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/config/base_response/base_response.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/exam_result.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/exam_entity.dart';
import 'package:exam_app_elevate/features/home/questions/domain/use_case/question_usecase.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_event.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_state.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../domain/entity/question_entity.dart';

class QuestionCubit extends Cubit<QuestionState> {
  Timer? _timer;
  ExamEntity examEntity;
  int remainingSec = 0;
  ExamResult? examResult;
  final QuestionUsecase _useCase;
  PageController controller = PageController();

  QuestionCubit(this._useCase, this.examEntity) : super(QuestionState.init());

  void doIntent(QuestionEvent event) {
    switch (event) {
      case GetQuestionEvent():
        _getQuestions();
        break;
      case NextPageEvent():
        _nextButton();
        break;
      case PrevPageEvent():
        _prevPage();
        break;

      case AnswerSelectedEvent():
        _answerSelected(event.answer, event.answerIndex);
        break;
      case FinishExamEvent():
        _finishExam();
        break;
    }
  }

  Future<void> _getQuestions() async {
    emit(
      state.copyWith(
        questionsState: BaseState<List<QuestionEntity>>(
          isLoading: true,
          data: null,
          errorMessage: null,
        ),
      ),
    );

    final response = await _useCase.getQuestions();
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
          ),
        );
        _startTimer();

        break;

      case ErrorBaseResponse<List<QuestionEntity>>():
        emit(
          state.copyWith(
            questionsState: BaseState<List<QuestionEntity>>(
              isLoading: false,
              data: null,
              errorMessage: response.message,
            ),
          ),
        );
    }
  }

  void _startTimer() {
    remainingSec = examEntity.duration * 60;
    _timer?.cancel(); // بنلغي أي تايمر قديم لو موجود

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSec > 0) {
        remainingSec--;
        emit(state);
      } else {
        _timer?.cancel();
      }
    });
  }

  void _nextButton() {
    if (state.currentIndexPage < state.questionsState.data!.length - 1) {
      controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentIndexPage: state.currentIndexPage + 1));
    }
  }

  void _prevPage() {
    if (state.currentIndexPage > 0) {
      controller.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentIndexPage: state.currentIndexPage - 1));
    }
  }

  void _answerSelected(String selectedAnswer, int questionIndex) {
    var list = state.questionsState.data;
    list?[questionIndex].userAnswer = selectedAnswer;
    emit(
      state.copyWith(questionsState: state.questionsState.copyWith(data: list)),
    );
  }

  void _finishExam() {
    int correctAnswer = 0;
    int wrongAnswer = 0;
    for (var question in state.questionsState.data ?? []) {
      if (question.userAnswer == question.correctAnswerKey) {
        correctAnswer++;
      } else {
        wrongAnswer++;
      }
    }
    examResult = ExamResult(
      correctCounter: correctAnswer,
      wrongCounter: wrongAnswer,
    );
  }
}
