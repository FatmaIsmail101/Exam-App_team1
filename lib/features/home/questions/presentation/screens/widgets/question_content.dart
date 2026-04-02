import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'answers_widget.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent({
    super.key,
    required this.questionEntity,
    required this.onTap,
  });

  final QuestionEntity questionEntity;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Text(questionEntity.question),
          ...questionEntity.answersListResponse.map(
            (e) => InkWell(
              onTap: () {
                onTap(e.key ?? "");
              },
              child: AnswersWidget(
                answer: e.answer ?? "",
                isSelected: questionEntity.userAnswer == e.key,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
