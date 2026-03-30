import 'package:exam_app_elevate/config/di/di.dart';
import 'package:exam_app_elevate/core/values/icon_paths.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/screens/general_function/formate_time.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/screens/widgets/exam_screen_bottom_widget.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/screens/widgets/question_content.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/screens/widgets/question_header.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_cubit.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../../main.dart';
import '../../data/model/question_types.dart';
import '../view_model/question_event.dart';
import 'general_function/vibration.dart';

class ExamsScreen extends StatelessWidget {
  ExamsScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<QuestionCubit>(
      create: (context) =>
          getIt<QuestionCubit>()
            ..doIntent(getQuestionEvent("670070a830a3c3c1944a9c63")),
      child: BlocConsumer<QuestionCubit, QuestionState>(
        listener: (context, state) {
          if (state.time == 0) {
            VibrationFunctions.triggerVibration();
            CustomDialog.showTimeOutDialog(context, () {
              context.read<QuestionCubit>().doIntent(ViewScore());
              talker.debug("View Score");
            });
            Navigator.pushReplacementNamed(context, RoutesName.scoreScreen);
          }
        },
        listenWhen: (previous, current) => current.time != previous.time,
        builder: (context, state) {
          final questionsState = state.questionsState;
          final data = questionsState?.data;

          // 1. نجيب المدة الكلية من أول سؤال (بالدقائق) ونحولها لثواني
          int totalDurationMinutes = data?.first.duration ?? 0;
          int totalSeconds = totalDurationMinutes * 60;

          // 2. نحسب نص الوقت
          int halfTime = totalSeconds ~/ 2;
          // 3. نجيب الوقت الحالي من الـ State
          int currentTime = state.time ?? 0;
          if (questionsState?.isLoading == true &&
              questionsState?.data == null &&
              questionsState?.errorMessage == null) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (questionsState?.errorMessage != null &&
              questionsState?.isLoading == false &&
              questionsState?.data == null) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Text(
                    questionsState?.errorMessage ?? "Error",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          }
          if (questionsState?.data?.isEmpty ??
              true &&
                  questionsState?.isLoading == false &&
                  questionsState?.errorMessage == null) {
            return Center(child: Text("No Data"));
          }
          final totalQuestions = data?.length ?? 1;
          final currentQuestionIndex = (state.currentIndex ?? 0) + 1;

          // حساب النسبة
          double progressValue = currentQuestionIndex / totalQuestions;

          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              actionsPadding: .symmetric(horizontal: 12.w),
              automaticallyImplyLeading: false,
              // بيلغي زرار الرجوع التلقائي
              titleSpacing: 8.w,
              // مسافة بسيطة من حافة الشاشة
              title: Row(
                children: [
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_back_ios, size: 22.w),
                    onPressed: () {},
                  ),
                  Text(
                    data?.first.title ?? "",
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              actions: [
                Image.asset(IconPaths.timerIcon),
                SizedBox(width: 6.w),
                Text(
                  FormateTime.formatTime(currentTime),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: (currentTime <= halfTime && currentTime > 0)
                        ? const Color(0xffCC1010) // الأحمر
                        : const Color(0xff11CE19),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                spacing: 24.h,
                children: [
                  QuestionHeader(
                    value: progressValue,
                    counter: "${(state.currentIndex ?? 0) + 1}",
                    questionNum: totalQuestions.toString(),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (index) {},
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        // داخل itemBuilder في الـ PageView
                        return QuestionContent(
                          // هنا التغيير: هات الإجابة بتاعة السؤال ده من الماب
                          selectedAnswerKey: state.selectedAnswers[index] ?? "",
                          question: data?[index].question ?? "",
                          answers: data?[index].answersListResponse ?? [],
                          questionTypes:
                              data?[index].type ?? QuestionTypes.singleChoice,
                        );
                      },
                      itemCount: data?.length,
                    ),
                  ),
                  ExamScreenBottomWidget(
                    answerKey:
                        state.questionsState?.data?.first.selectedAnswerKey ??
                        "",
                    isAnswered: state.isButtonEnabled ?? false,
                    pageController: pageController,
                    length: data?.length ?? 0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
