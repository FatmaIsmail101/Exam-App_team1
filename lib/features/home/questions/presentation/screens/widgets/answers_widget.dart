import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/values/icon_paths.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({
    super.key,
    required this.answer,
    this.isSelected = false,
  });

  final String answer;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: .only(top: 18.h, left: 20.w, bottom: 18.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xffCCD7EB) : Color(0xffEDEFF3),
        borderRadius: .circular(10.r),
      ),
      child: Row(
        spacing: 4.w,
        children: [
          Image.asset(IconPaths.singleChoiceIcon),
          Expanded(
            child: Text(
              answer,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Color(0xff0F0F0F),
                fontSize: 14.sp,
                fontWeight: .w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
