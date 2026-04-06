import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text/text_theme_app.dart';

abstract class TextFieldTheme {
  static InputDecorationTheme inputDecorationThemetextField =
      InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 8.r),
        counterStyle: TextThemeApp.medium20Black.copyWith(
          color: Color(0xff0F0F0F),
          fontSize: 20.sp,
        ),
        hintStyle: TextThemeApp.medium20Black.copyWith(
          color: Color(0xffA6A6A6),
          fontSize: 20.sp,
        ),
        labelStyle: TextThemeApp.medium20Black.copyWith(fontSize: 16.sp),
        filled: false,
        focusColor: Color(0xff0F0F0F),

        activeIndicatorBorder: BorderSide(color: Color(0xff0F0F0F)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: Color(0xff535353)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: Color(0xff535353)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: Color(0xff0F0F0F)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: Color(0xffCC1010)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: Color(0xffCC1010)),
        ),
        errorStyle: TextThemeApp.bodySmall16Red,

        floatingLabelStyle: TextStyle(color: Color(0xff0F0F0F)),
      );
}
