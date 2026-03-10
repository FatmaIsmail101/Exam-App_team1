import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/values/app_strings.dart';
import '../widgets/forget_password_block.dart';
import '../widgets/forget_password_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  bool? isFormValid;

  final pageController = PageController();

  final confirmController = TextEditingController();

  final newPasswordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    confirmController.dispose();
    newPasswordController.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: formKey,
      onChanged: () {
        setState(() {
          isFormValid = formKey.currentState?.validate() ?? false;
        });
      },
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 24.h,
        children: [
          ForgetPasswordBlock(
            title: AppStrings.resetPassword,
            content: AppStrings.resetPasswordDescription,
          ),
          SizedBox(height: 8.h),
          ForgetPasswordTextField(
            controller: newPasswordController,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.newPasswordMessage;
              }
              RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
              if (!regex.hasMatch(value)) {
                return AppStrings.newPasswordMessage;
              }
              return null;
            },
            hintText: AppStrings.hintNewPassword,
            labelText: AppStrings.labelNewPassword,
          ),
          ForgetPasswordTextField(
            controller: confirmController,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value != newPasswordController.text) {
                return AppStrings.newPasswordMessage;
              }
              // String pattern = AppStrings.emailRegex;
              // RegExp regex = RegExp(pattern);
              // if (!regex.hasMatch(value)) {
              //   return AppStrings.newPasswordMessage;
              // }
              return null;
            },
            hintText: AppStrings.labelConfirmPassword,
            labelText: AppStrings.labelConfirmPassword,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              if (isFormValid == true || isFormValid == null) {
                if (formKey.currentState!.validate() &&
                    newPasswordController.text == confirmController.text) {
                  // تأكيد أخير قبل النقل
                  pageController.nextPage(
                    duration: Duration(
                      milliseconds: 300,
                    ), // زودت الوقت شوية عشان يبان السلاسة
                    curve: Curves.easeIn,
                  );
                }
              }
              null;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: (isFormValid == false)
                  ? Color(0xff878787)
                  : Color(0xff02369C),
            ),
            child: Text(
              AppStrings.continueButton,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Color(0xffF9F9F9),
                fontWeight: .bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
