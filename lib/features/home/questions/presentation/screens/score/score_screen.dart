import 'package:exam_app_elevate/core/routes/routes_name.dart';
import 'package:exam_app_elevate/core/values/app_strings.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/exam_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../view_model/question_cubit.dart';
import '../../view_model/question_event.dart';
import '../widgets/score_result_widget.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ExamResult examResult =
        ModalRoute.of(context)?.settings.arguments as ExamResult;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_back_ios, size: 25.w),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppStrings.viewScore),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          spacing: 24.h,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Your score"),
            Row(
              spacing: 24.w,
              children: [
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 12.0,
                  percent:
                      examResult.correctCounter /
                      examResult.wrongCounter /
                      (examResult.correctCounter + examResult.wrongCounter) *
                      100,
                  // دي النسبة (80 / 100)
                  center: Text(
                    "2",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  progressColor: Color(0xff02369C),
                  backgroundColor: Color(0xffCC1010),
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                ScoreResultWidget(
                  correct: examResult.correctCounter.toString(),
                  wrong: examResult.wrongCounter.toString(),
                ),
              ],
            ),
            SizedBox(height: 56.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.resultScreen);
              },
              child: Text(
                AppStrings.showResult,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Color(0xffF9F9F9),
                  fontWeight: .w700,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF9F9F9),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xff02369C), width: 1.w),
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              onPressed: () {
                context.read<QuestionCubit>().doIntent(GetQuestionEvent());

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName.examsScreen,
                  (route) => false,
                );
              },
              child: Text(
                AppStrings.startAgain,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: .bold,
                  color: Color(0xff02369C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
