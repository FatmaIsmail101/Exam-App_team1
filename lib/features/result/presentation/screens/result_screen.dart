import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/app_strings.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25.w,
            color: Color(0xff0F0F0F),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppStrings.answer),
      ),
    );
  }
}
