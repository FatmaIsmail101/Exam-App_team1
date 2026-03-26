import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/values/app_strings.dart';

class QuestionBlock extends StatelessWidget {
  const QuestionBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 4.h,
      children: [
        Row(
          spacing: 4.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.question, style: theme.textTheme.labelSmall),
            Text(AppStrings.to, style: theme.textTheme.labelSmall),
          ],
        ),
        LinearProgressIndicator(
          value: 0.5, // القيمة من 0.0 لـ 1.0
          backgroundColor: Color(0xffCFCFCF),
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff02369C)),
          minHeight: 4.h,
          borderRadius: BorderRadius.circular(10),
        ),
        SizedBox(height: 26.h),
        Text(
          AppStrings.questionContent,
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 18.sp),
        ),
      ],
    );
  }
}
