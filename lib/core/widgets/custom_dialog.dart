import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/image_paths.dart';

class CustomDialog {
  static void showTimeOutDialog(BuildContext context, VoidCallback onPressed) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      barrierDismissible: false, // يمنع إغلاق الدايلوج عند الضغط خارجه
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.0.r,
            ), // الحواف المستديرة للنافذة
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min, // يجعل الطول على قد المحتوى
              children: [
                // 1. صورة الساعة الرملية
                Padding(
                  padding: EdgeInsets.only(top: 42.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //spacing: 28.w,
                    children: [
                      Image.asset(
                        ImagePaths
                            .timeOut, // تأكد من إضافة الصورة في ملف pubspec.yaml
                        height: 100.h,
                      ),

                      // 2. نص Time out
                      Text("Time out !!", style: theme.textTheme.labelLarge),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                // 3. زر View Score
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 40.0.h,
                    left: 50.0.w,
                    right: 50.0.w,
                  ),
                  child: SizedBox(
                    width: double.infinity, // لجعل الزر يأخذ العرض المتاح
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                          0xFF02369C,
                        ), // لون أزرق غامق نفس الصورة
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                      ),
                      child: Text(
                        "View score",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Color(0xffF9F9F9),
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
