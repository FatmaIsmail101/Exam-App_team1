import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinWidget extends StatelessWidget {
  const PinWidget({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: MaterialPinField(
        length: 4,
        onCompleted: (pin) => pageController.nextPage(
          duration: Duration(microseconds: 2000),
          curve: Curves.easeIn,
        ),
        onChanged: (value) {
          final pattern = RegExp(r'^[0-9]+$');
          if (!pattern.hasMatch(value)) {
            return;
          } else {
            "No ";
          }
        },
        theme: MaterialPinTheme(
          shape: MaterialPinShape.outlined,
          cellSize: Size(74.w, 68.h),
          borderRadius: BorderRadius.circular(10.r),
          fillColor: Color(0xffDFE7F7),
          borderColor: Color(0xffDFE7F7),
          cursorColor: Colors.black,
          animateCursor: true,
          animationDuration: Duration(milliseconds: 300),
          animationCurve: Curves.easeInBack,
          completeBorderColor: Color(0xffDFE7F7),
          completeTextStyle: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 16.sp,
            fontWeight: .w500,
          ),
          completeFillColor: Color(0xffDFE7F7),
          errorBorderColor: Color(0xffCC1010),
          errorBorderWidth: 2.w,
          errorFillColor: Color(0xffF9F9F9),
          focusedFillColor: Color(0xffDFE7F7),
        ),
      ),
    );
  }
}
