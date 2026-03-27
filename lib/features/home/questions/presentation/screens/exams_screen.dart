import 'package:exam_app_elevate/config/di/di.dart';
import 'package:exam_app_elevate/core/routes/routes_name.dart';
import 'package:exam_app_elevate/core/values/app_strings.dart';
import 'package:exam_app_elevate/core/values/icon_paths.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/screens/widgets/question_block.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_cubit.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/image_paths.dart';
import '../../../../../main.dart';
import '../view_model/question_event.dart';

class ExamsScreen extends StatelessWidget {
  ExamsScreen({super.key});
  final PageController pageController = PageController();
  int counterNum = 1;
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
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      Image.asset(ImagePaths.timeOut),
                      Text(AppStrings.timeOutMessage),
                    ],
                  ),
                );
              },
            );
          }
        },
        builder: (context, state) {
          // 1. نجيب المدة الكلية من أول سؤال (بالدقائق) ونحولها لثواني
          int totalDurationMinutes =
              state.questionsState?.data?.first.duration ?? 0;
          int totalSeconds = totalDurationMinutes * 60;

          // 2. نحسب نص الوقت
          int halfTime = totalSeconds ~/ 2;

          // 3. نجيب الوقت الحالي من الـ State
          int currentTime = state.time ?? 0;
          talker.info(state.questionsState?.data?.length);

          if (state.questionsState?.isLoading == true &&
              state.questionsState?.data == null &&
              state.questionsState?.errorMessage == null) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (state.questionsState?.errorMessage != null &&
              state.questionsState?.isLoading == false &&
              state.questionsState?.data == null) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Text(
                    state.questionsState?.errorMessage ?? "Error",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          }
          if (state.questionsState?.data?.isEmpty ??
              true &&
                  state.questionsState?.isLoading == false &&
                  state.questionsState?.errorMessage == null) {
            return Center(child: Text("No Data"));
          }
          // حسابات الوقت
          int currentDuration = state.time ?? 0;
          int isHalf = currentDuration ~/ 2;

          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              actionsPadding: .symmetric(horizontal: 12.w),
              automaticallyImplyLeading: false, // بيلغي زرار الرجوع التلقائي
              titleSpacing: 8.w, // مسافة بسيطة من حافة الشاشة
              title: Row(
                children: [
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_back_ios, size: 22.w),
                    onPressed: () {},
                  ),
                  Text(
                    state.questionsState?.data?.first.title ?? "",
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              actions: [
                Image.asset(IconPaths.timerIcon),
                SizedBox(width: 6.w),
                Text(
                  _formatTime(currentTime),
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
                  QuestionBlock(
                    counter: "${(state.currentIndex ?? 0) + 1}",
                    questionNum:
                        state.questionsState?.data?.first.numberOfQuestions
                            .toString() ??
                        "",
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        talker.info(pageController.page);
                        //counterNum = index + 1;
                        return Placeholder();
                      },
                      itemCount: state.questionsState?.data?.length,
                    ),
                  ),
                  SizedBox(height: 56.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: .start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF9F9F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: BorderSide(color: Color(0xff02369C)),
                          ),
                          padding: .symmetric(horizontal: 65.w, vertical: 14.h),
                        ),
                        onPressed: () {
                          if (pageController.hasClients) {
                            // 1. نجيب الصفحة الحالية
                            int currentPage = pageController.page?.round() ?? 0;

                            // 2. نتأكد إننا مش في أول صفحة (عشان نقدر نرجع)
                            if (currentPage > 0) {
                              int prevPageIndex =
                                  currentPage - 1; // طرح مباشر وصريح

                              // 3. نحرك الـ PageView
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );

                              // 4. نبلغ الـ Cubit بالـ Index الجديد (اللي هو الأصغر بـ 1)
                              context.read<QuestionCubit>().doIntent(
                                ChangePageEvent(prevPageIndex),
                              );
                            }
                          }
                        },
                        child: Text(
                          AppStrings.backButtonText,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Color(0xff02369C),
                            fontWeight: .bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: BorderSide(color: Color(0xff02369C)),
                          ),
                          padding: .symmetric(horizontal: 65.w, vertical: 14.h),
                        ),
                        // داخل زرار الـ Next
                        onPressed: () {
                          if (pageController.hasClients) {
                            int totalItems =
                                state.questionsState?.data?.length ?? 0;
                            int currentPage = pageController.page?.round() ?? 0;

                            if (currentPage < totalItems - 1) {
                              int nextPageIndex = currentPage + 1;
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                              context.read<QuestionCubit>().doIntent(
                                ChangePageEvent(nextPageIndex),
                              );
                              // هنا ممكن تبعتي intent للـ Cubit يغير الـ index الحالي لو محتاجة الرقم في الـ UI
                              // context.read<QuestionCubit>().changePageIndex(currentPage + 1);
                            } else {
                              Navigator.pushNamed(
                                context,
                                RoutesName.resultScreen,
                              );
                            }
                          }
                        },
                        child: Text(
                          AppStrings.nextButtonText,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Color(0xffF9F9F9),
                            fontWeight: .bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    // الـ padLeft(2, '0') بتضمن إن الرقم لو 5 يظهر 05
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
