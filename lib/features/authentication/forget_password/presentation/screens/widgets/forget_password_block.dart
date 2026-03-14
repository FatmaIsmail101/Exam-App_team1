import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordBlock extends StatelessWidget {
  const ForgetPasswordBlock({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 16.h,
      mainAxisAlignment: .center,
      children: [
        SizedBox(height: 24.h),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 18.sp),
        ),
        Text(
          softWrap: true,
          textAlign: .center,
          maxLines: 2,
          content,
          style: theme.textTheme.labelSmall,
        ),
      ],
    );
  }
}
