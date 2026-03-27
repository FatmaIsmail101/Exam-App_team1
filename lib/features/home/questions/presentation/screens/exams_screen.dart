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

import '../view_model/question_event.dart';

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
          if (state.questionsState?.data?.first.duration == 0) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(title: Text("Allow"));
              },
            );
          }
        },
        builder: (context, state) {
          if (state.questionsState?.isLoading == true &&
              state.questionsState?.data == null &&
              state.questionsState?.errorMessage == null) {
            return Center(child: CircularProgressIndicator());
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
          int currentDuration = state.questionsState?.data?.first.duration ?? 0;
          int isHalf = 30;

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
                  state.questionsState?.data?.first.duration.toString() ?? "",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: state.questionsState?.data?.first.duration == isHalf
                        ? Color(0xffCC1010)
                        : Color(0xff11CE19),
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
                    questionNum:
                        state.questionsState?.data?.first.numberOfQuestions
                            .toString() ??
                        "",
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Placeholder(),
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
                          if (pageController.hasClients &&
                              pageController.page! > 0) {
                            pageController.previousPage(
                              // تعديل لـ previous
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
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
                        onPressed: () {
                          // 1. أولاً: نتأكد إن الكنترولر متصل بالـ PageView وجاهز
                          if (pageController.hasClients) {
                            // 2. نقارن الصفحة الحالية بآخر صفحة
                            // ملاحظة: الـ page بترجع double، والـ maxScrollExtent بتقيس بالـ pixels
                            // الأفضل نستخدم الـ index بتاع الصفحة
                            if (pageController.page == 3) {
                              Navigator.pushNamed(
                                context,
                                RoutesName.resultScreen,
                              );
                            } else {
                              // 3. لو مش آخر صفحة، انقل للصفحة اللي بعدها
                              pageController.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn,
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
}
