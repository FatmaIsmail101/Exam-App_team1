import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/icon_paths.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    super.key,
    required this.answer,
    this.isSelected = false, // هل اليوزر اختار الإجابة دي؟
    this.isCorrect = false, // هل الإجابة دي هي الصح فعلاً؟
    this.showResult = false, // هل احنا في صفحة النتائج (عشان نظهر الألوان)؟
  });

  final String answer;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // تحديد لون الخلفية بناءً على الحالة
    Color getBackgroundColor() {
      if (!showResult) {
        return isSelected ? const Color(0xffCCD7EB) : const Color(0xffEDEFF3);
      }
      // حالات صفحة النتائج
      if (isCorrect) return const Color(0xffE7F8E8); // أخضر للإجابة الصحيحة
      if (isSelected && !isCorrect)
        return const Color(0xffF8E7E7); // أحمر لو اختار غلط
      return const Color(0xffEDEFF3); // افتراضي
    }

    // تحديد لون الحدود (Border)
    Border? getBorder() {
      if (!showResult) return null;
      if (isCorrect)
        return Border.all(color: const Color(0xff11CE19), width: 1);
      if (isSelected && !isCorrect)
        return Border.all(color: const Color(0xffCC1010), width: 1);
      return null;
    }

    // تحديد الأيقونة
    Widget getIcon() {
      if (!showResult) {
        return Image.asset(
          isSelected
              ? IconPaths.selectedSingleChoiceIcon
              : IconPaths.singleChoiceIcon,
        );
      }
      if (isCorrect)
        return const Icon(Icons.check_circle, color: Color(0xff11CE19));
      if (isSelected && !isCorrect)
        return const Icon(Icons.cancel, color: Color(0xffCC1010));
      return Image.asset(IconPaths.singleChoiceIcon);
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: getBackgroundColor(),
        border: getBorder(),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          getIcon(),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              answer,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: const Color(0xff0F0F0F),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
