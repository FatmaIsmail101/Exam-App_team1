import 'package:exam_app_elevate/core/values/icon_paths.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/question_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({
    super.key,
    required this.answers,
    required this.questionTypes,
    this.isSelected = false,
    required this.onTap,
  });
  final String answers;
  final QuestionTypes questionTypes;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: .only(top: 18.h, left: 20.w, bottom: 18.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffCCD7EB) : Color(0xffEDEFF3),
          borderRadius: .circular(10.r),
        ),
        child: Row(
          spacing: 4.w,
          children: [
            Image.asset(_getIconPath()),
            Expanded(
              child: Text(
                answers,
                // softWrap: true,
                // overflow: .ellipsis,
                // maxLines: 2,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Color(0xff0F0F0F),
                  fontSize: 14.sp,
                  fontWeight: .w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getIconPath() {
    if (questionTypes == QuestionTypes.singleChoice) {
      // لو سؤال اختيار واحد
      return isSelected
          ? IconPaths
                .selectedSingleChoiceIcon // أيكونة الدائرة المختارة
          : IconPaths.singleChoiceIcon; // أيكونة الدائرة الفاضية
    } else {
      // لو سؤال اختيار متعدد
      return isSelected
          ? IconPaths
                .selectedMultipleChoiceIcon // أيكونة المربع المختار
          : IconPaths.multipleChoiceIcon; // أيكونة المربع الفاضي
    }
  }
}
