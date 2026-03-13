import 'package:exam_app_elevate/core/theme/text/text_theme_app.dart';
import 'package:flutter/material.dart';

abstract class BottomNavigationBarThemeApp {
  static BottomNavigationBarThemeData bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
        backgroundColor: Color(0xffEDEFF3),
        selectedItemColor: Color(0xff02369C),
        unselectedItemColor: Color(0xff02369C),
        selectedIconTheme: IconThemeData(color: Color(0xff02369C)),
        unselectedIconTheme: IconThemeData(color: Color(0xff02369C)),
        type: .fixed,
        selectedLabelStyle: TextThemeApp.medium20Black.copyWith(
          color: Color(0xff02369C),
          fontWeight: .bold,
        ),
        unselectedLabelStyle: TextThemeApp.medium20Black.copyWith(
          color: Color(0xff02369C),
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
      );
}
