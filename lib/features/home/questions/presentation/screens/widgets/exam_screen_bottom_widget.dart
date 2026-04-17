import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/values/app_strings.dart';
import '../../view_model/question_cubit.dart';
import '../../view_model/question_event.dart';

class ExamScreenBottomWidget extends StatelessWidget {
  const ExamScreenBottomWidget({
    super.key,
    this.onNext,
    required this.onPrev,
    this.isLast = false,
  });

  final Function? onNext;
  final Function? onPrev;
  final bool isLast;
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
            onPrev?.call();
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
            padding: .symmetric(
              horizontal: isLast ? 55.w : 65.w,
              vertical: 14.h,
            ),
          ),
          // داخل زرار الـ Next
          // جوه زرار الـ Next في الـ ExamScreenBottomWidget
          onPressed: () {
            if (isLast) {
              final cubit = context.read<QuestionCubit>();
              cubit.doIntent(FinishExamEvent());
              Navigator.pushNamed(
                context,
                RoutesName.scoreScreen,
                arguments: cubit.examResult,
              );
            } else {
              onNext?.call();
            }
          },
          child: Text(
            isLast ? AppStrings.finish : AppStrings.nextButtonText,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Color(0xffF9F9F9),
              fontWeight: .bold,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
