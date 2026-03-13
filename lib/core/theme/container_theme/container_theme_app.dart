import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerThemeApp {
  static CardThemeData cardThemeData = CardThemeData(
    color: Color(0xffCCD7EB),
    clipBehavior: .antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    margin: .symmetric(vertical: 8.h, horizontal: 24.w),
  );
}
