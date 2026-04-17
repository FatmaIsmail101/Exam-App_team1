import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/values/app_strings.dart';

class ScoreResultWidget extends StatelessWidget {
  const ScoreResultWidget({
    super.key,
    required this.correct,
    required this.wrong,
  });

  final String correct;
  final String wrong;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 50.w,

          children: [
            Text(AppStrings.correct),

            Container(
              padding: .all(4.w),

              alignment: .center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(110.r),
                border: .all(color: Color(0xff02369C), width: 2.w),
              ),
              child: Text(correct.toString(), textAlign: .center),
            ),
          ],
        ),
        Row(
          spacing: 56.w,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppStrings.wrong),
            Container(
              padding: EdgeInsets.all(4.w),
              // width: 25.w,
              alignment: .center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(110.r),
                border: .all(color: Color(0xffCC1010), width: 2.w),
              ),
              child: Text(wrong.toString()),
            ),
          ],
        ),
      ],
    );
  }
}
