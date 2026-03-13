import 'package:exam_app_elevate/core/theme/bottom_navigation_bar_theme_app/bottom_navigation_bar_theme.dart';
import 'package:exam_app_elevate/core/theme/text/text_theme_app.dart';
import 'package:exam_app_elevate/core/theme/text_field/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'container_theme/container_theme_app.dart';

class ThemeApp {
  static final ThemeData themeApp = ThemeData(
    scaffoldBackgroundColor: Color(0xffF9F9F9),
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff02369C)),
    useMaterial3: true,
    textTheme: TextTheme(
      bodyMedium: TextThemeApp.medium20Black,
      bodySmall: TextThemeApp.semiBold12Black,
      titleSmall: TextThemeApp.semiBold12Blue,
      bodyLarge: TextThemeApp.bodySmall16Red,
      labelMedium: TextThemeApp.bodySmall16Red,
      labelSmall: TextThemeApp.bodyLarge14Grey,
    ),
    inputDecorationTheme: TextFieldTheme.inputDecorationThemetextField,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: .symmetric(vertical: 14.h),
        textStyle: TextThemeApp.medium20Black.copyWith(
          color: Color(0xffF9F9F9),
        ),
        backgroundColor: Color(0xff02369C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: .symmetric(horizontal: 146.w, vertical: 14.h),
        backgroundColor: Color(0xff02369C),
        textStyle: TextThemeApp.medium20Black.copyWith(
          color: Color(0xffF9F9F9),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffF9F9F9),
      iconTheme: IconThemeData(color: Color(0xff0F0F0F)),
      foregroundColor: Color(0xffF9F9F9),
      titleTextStyle: TextThemeApp.medium20Black,
    ),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeApp.bottomNavigationBarThemeData,
    cardTheme: ContainerThemeApp.cardThemeData,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color(0xff02369C),
    ),
  );
}
