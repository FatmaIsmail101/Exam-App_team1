import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextThemeApp {
  static TextStyle medium20Black = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.5.w,
  );
  static TextStyle bodyLarge14Grey = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Color(0xffA6A6A6),
    letterSpacing: 0.5.w,
    height: 1.7.h,
  );
  static TextStyle bodySmall16Red = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: Color(0xffCC1010),
    letterSpacing: 0.5.w,
    height: 1.7.h,
  );
  static TextStyle semiBold12Blue = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xff02369C),
    letterSpacing: 0.0,
  );
  static TextStyle semiBold12Black = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    letterSpacing: 0.0,
  );
  static TextStyle bodyLarge24Black = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xff0F0F0F),
  );
}
