import 'package:exam_app_elevate/core/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../view_model/question_cubit.dart';
import '../../view_model/question_event.dart';
import '../../view_model/question_state.dart';
import '../widgets/score_result_widget.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key, required this.cubit});
  final QuestionCubit cubit;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final cubit = ModalRoute.of(context)!.settings.arguments as QuestionCubit;
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            // constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: Icon(Icons.arrow_back_ios, size: 25.w),
            onPressed: () {},
          ),
          title: Text("Exam Score"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            spacing: 24.h,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Your score"),
              BlocBuilder<QuestionCubit, QuestionState>(
                builder: (context, state) {
                  // if (state.examResultState?.isLoading == true &&
                  //     state.examResultState?.data == null &&
                  //     state.examResultState?.errorMessage == null) {
                  //   return Center(child: CircularProgressIndicator());
                  // }
                  final int correct =
                      state.examResultState?.data?.correctCounter ?? 0;
                  final int wrong =
                      state.examResultState?.data?.wrongCounter ?? 0;

                  // 2. حساب الإجمالي (الصح + الغلط)
                  final int total = correct + wrong;

                  // 3. حساب النسبة (قيمة بين 0.0 و 1.0 للـ Chart)
                  // عملنا check عشان لو الإجمالي 0 م يحصلش Division by zero error
                  double percentValue = (total > 0) ? (correct / total) : 0.0;

                  // 4. حساب النص اللي هيتعرض (مثلاً 80%)
                  String displayPercentage = "${(percentValue * 100).toInt()}%";
                  return Row(
                    spacing: 24.w,
                    children: [
                      CircularPercentIndicator(
                        radius: 80.0,
                        lineWidth: 12.0,
                        percent: percentValue,
                        // دي النسبة (80 / 100)
                        center: Text(
                          displayPercentage,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        progressColor: Color(0xff02369C),
                        // اللون الأساسي (الصح)
                        backgroundColor: Color(0xffCC1010),
                        // اللون الخلفي (الغلط)
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      ScoreResultWidget(correct: correct, wrong: wrong),
                    ],
                  );
                },
              ),
              SizedBox(height: 56.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.resultScreen);
                },
                child: Text(
                  "Show results",
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
                  //context.read<QuestionCubit>().doIntent(ViewScore());
                  context.read<QuestionCubit>().doIntent(
                    getQuestionEvent("670070a830a3c3c1944a9c63"),
                  );
                  // 2. ارجعي للشاشة الأساسية
                  // استخدمي pushNamedAndRemoveUntil عشان تنظفي الـ Stack تماماً وتبدأي نظيف
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesName.examsScreen,
                    (route) => false,
                  );
                },
                child: Text(
                  "Start again",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: .bold,
                    color: Color(0xff02369C),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
