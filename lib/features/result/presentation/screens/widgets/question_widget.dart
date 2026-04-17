import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/questions/domain/entity/question_entity.dart';
import 'answers_widget.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key, required this.questionEntity});
  final QuestionEntity questionEntity;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: .symmetric(vertical: 16.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x402a2929),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        spacing: 16.h,
        children: [
          Text(
            questionEntity.question,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Color(0xff0F0F0F),
            ),
          ),

          ...questionEntity.answersListResponse.map(
            (e) => AnswerWidget(
              answer:
                  e.answer ??
                  "", // ✅ بنعرض نص الاختيار الحالي (e) وليس الـ userAnswer
              showResult: true,

              // ✅ هل الاختيار الحالي (e) هو اللي اليوزر اختاره؟
              isSelected: e.key == questionEntity.userAnswer,

              // ✅ هل الاختيار الحالي (e) هو الإجابة الصحيحة فعلاً؟
              isCorrect: e.key == questionEntity.correctAnswerKey,
            ),
          ),
        ],
      ),
    );
  }
}
