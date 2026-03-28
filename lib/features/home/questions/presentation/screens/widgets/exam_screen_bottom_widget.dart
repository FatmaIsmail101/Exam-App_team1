import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/values/app_strings.dart';
import '../../view_model/question_cubit.dart';
import '../../view_model/question_event.dart';

class ExamScreenBottomWidget extends StatelessWidget {
  ExamScreenBottomWidget({
    super.key,
    required this.pageController,
    required this.length,
    this.isAnswered = false,
  });
  PageController pageController;
  int length;
  bool isAnswered = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
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
                int prevPageIndex = currentPage - 1; // طرح مباشر وصريح

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
          onPressed: isAnswered
              ? () {
                  if (pageController.hasClients) {
                    int totalItems = length;
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
                      Navigator.pushNamed(context, RoutesName.resultScreen);
                    }
                  }
                }
              : null,
          child: Text(
            AppStrings.nextButtonText,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Color(0xffF9F9F9),
              fontWeight: .bold,
            ),
          ),
        ),
      ],
    );
  }
}
