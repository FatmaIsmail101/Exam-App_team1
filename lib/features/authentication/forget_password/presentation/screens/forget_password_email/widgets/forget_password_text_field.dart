import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/values/app_strings.dart';

class ForgetPasswordTextField extends StatefulWidget {
  const ForgetPasswordTextField({super.key});

  @override
  State<ForgetPasswordTextField> createState() =>
      _ForgetPasswordTextFieldState();
}

class _ForgetPasswordTextFieldState extends State<ForgetPasswordTextField> {
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      style: theme.textTheme.bodyMedium?.copyWith(
        fontSize: 16.sp,
        fontWeight: .w500,
      ),
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        focusColor: Color(0xffA6A6A6),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffA6A6A6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffA6A6A6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffA6A6A6)),
        ),
        labelText: AppStrings.emailLabel,
        hintText: AppStrings.emailHint,
        hintStyle: theme.textTheme.labelSmall,
        labelStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return TextStyle(
              color: Colors.red,
              fontSize: 16.sp,
            ); // أحمر في حالة الخطأ
          }
          return TextStyle(
            color: const Color(0xffA6A6A6),
            fontSize: 16.sp,
          ); // رمادي في الحالة العادية
        }),
        floatingLabelStyle: TextStyle(color: Color(0xffA6A6A6)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.emailMessage;
        }
        String pattern = AppStrings.emailRegex;
        RegExp regex = RegExp(pattern);
        if (!regex.hasMatch(value)) {
          return AppStrings.emailMessage;
        }
        return null;
      },
    );
  }
}
