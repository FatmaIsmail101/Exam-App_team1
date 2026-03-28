import 'package:exam_app_elevate/features/home/questions/data/model/answers_list_response.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/question_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/question_cubit.dart';
import '../../view_model/question_event.dart';
import 'answers_widget.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent({
    super.key,
    required this.question,
    required this.answers,
    required this.questionTypes,
    required this.selectedAnswerKey,
    required this.index,
  });
  final int index;
  final String question;
  final List<AnswersListResponse> answers;
  final String selectedAnswerKey; // الإجابة المختارة للسؤال ده حالياً
  final QuestionTypes questionTypes;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Text(question),
          ...answers.map(
            (e) => AnswersWidget(
              questionTypes: questionTypes,
              answers: e.answer ?? "",
              isSelected: selectedAnswerKey == e.key,
              onTap: () {
                context.read<QuestionCubit>().doIntent(
                  AnswerSelectedEvent(e.key!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
