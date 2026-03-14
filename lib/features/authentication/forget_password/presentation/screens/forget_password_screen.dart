import 'package:exam_app_elevate/config/di/di.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/presentation/screens/forget_password_email/forget_password_email.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/presentation/screens/reset_password/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/app_strings.dart';
import '../view_model/forget_password_view_model_cubit.dart';
import 'forget_password_verify/forget_password_verify.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final pageController = PageController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt.get<ForgetPasswordViewModel>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        //تخلي الكيبورد يقفل لو المستخدم داس في أي حتة فاضية في الشاشة
        child: Scaffold(
          resizeToAvoidBottomInset: true, //عشان الكيبورد

          appBar: AppBar(
            title: Text(AppStrings.password, style: theme.textTheme.bodyMedium),

            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new, size: 30.w),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ForgetPasswordEmail(
                  pageController: pageController,
                  controller: emailController,
                ),
                ForgetPasswordVerify(
                  pageController: pageController,
                  controller: emailController,
                ),
                ResetPasswordScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
