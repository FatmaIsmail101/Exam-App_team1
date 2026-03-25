import 'package:exam_app_elevate/core/routes/routes_name.dart';
import 'package:exam_app_elevate/core/values/app_strings.dart';
import 'package:exam_app_elevate/core/values/icon_paths.dart';
import 'package:exam_app_elevate/features/home/exams_questions/presentation/screens/widgets/question_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamsScreen extends StatelessWidget {
  ExamsScreen({super.key});
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            Text("Exam", style: theme.textTheme.bodyMedium),
          ],
        ),
        actions: [
          Image.asset(IconPaths.timerIcon),
          SizedBox(width: 6.w),
          Text("00:00", style: theme.textTheme.bodyMedium),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          spacing: 24.h,
          children: [
            QuestionBlock(),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Placeholder(),
                itemCount: 4,
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
                    if (pageController.hasClients && pageController.page! > 0) {
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
                        Navigator.pushNamed(context, RoutesName.resultScreen);
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
  }
}
