import 'package:exam_app_elevate/features/authentication/forget_password/presentation/screens/forget_password_verify/widgets/pin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/values/app_strings.dart';
import '../widgets/forget_password_block.dart';

class ForgetPasswordVerify extends StatelessWidget {
  const ForgetPasswordVerify({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 32.h,
      children: [
        ForgetPasswordBlock(
          title: AppStrings.forgetPassword,
          content: AppStrings.passwordScreenDescription,
        ),
        PinWidget(pageController: pageController),
        SizedBox(height: 16.h),
      ],
    );
  }
}
