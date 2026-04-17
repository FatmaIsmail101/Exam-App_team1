import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/values/app_strings.dart';

class QuestionHeader extends StatelessWidget {
  const QuestionHeader({
    super.key,
    required this.questionNum,
    required this.totalQuetionNum,
  });

  final int questionNum;
  final int totalQuetionNum;

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
            Text(totalQuetionNum.toString(), style: theme.textTheme.labelSmall),
            Text(AppStrings.to, style: theme.textTheme.labelSmall),
            Text(questionNum.toString(), style: theme.textTheme.labelSmall),
          ],
        ),
        LinearProgressIndicator(
          trackGap: 10,
          value: (totalQuetionNum + 1) / questionNum,
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
