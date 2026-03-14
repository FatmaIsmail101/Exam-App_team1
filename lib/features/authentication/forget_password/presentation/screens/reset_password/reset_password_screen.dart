import 'package:exam_app_elevate/core/routes/routes_name.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/presentation/view_model/forget_password_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/notification/notification.dart';
import '../../../../../../core/utils/text_field_validation.dart';
import '../../../../../../core/values/app_strings.dart';
import '../../../data/models/reset_password/reset_password_request.dart';
import '../../view_model/states/forget_password_event.dart';
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

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
      listener: (context, state) async {
        if (state.resetPasswordState.isLoading == false &&
            state.resetPasswordState.data != null &&
            state.resetPasswordState.errorMessage == null) {
          NotificationBar.showNotification(
            message: state.resetPasswordState.data?.message ?? "",
            type: .success,
            context: context,
          );

          if (isFormValid == true || isFormValid == null) {
            if (formKey.currentState!.validate()) {
              await Future.delayed(Duration(seconds: 1));
              // تأكدي إن الـ Widget لسه "mounted" قبل ما تنقلي لشاشة تانية
              if (!mounted) return;

              Navigator.of(context).pushNamedAndRemoveUntil(
                RoutesName.login,
                (route) =>
                    false, // ده بيمسح كل الشاشات اللي فاتت ويفتح الـ login كأنها أول شاشة
              );
            }
          }
        } else if (state.resetPasswordState.isLoading == false &&
            state.resetPasswordState.data == null &&
            state.resetPasswordState.errorMessage != null) {
          NotificationBar.showNotification(
            message: state.resetPasswordState.errorMessage ?? "",
            type: .failure,
            context: context,
          );
        }
      },
      child: Form(
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
              isPassword: true,
              controller: passwordController,
              textInputType: TextInputType.emailAddress,
              validator: Validation.validatePassword,
              hintText: AppStrings.hintNewPassword,
              labelText: AppStrings.labelNewPassword,
            ),
            ForgetPasswordTextField(
              isPassword: true,
              controller: confirmPasswordController,
              textInputType: TextInputType.visiblePassword,
              validator: Validation.validatePassword,
              hintText: AppStrings.labelConfirmPassword,
              labelText: AppStrings.labelConfirmPassword,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () async {
                // 1. التأكد إن الحقول مش فاضية
                if (passwordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  NotificationBar.showNotification(
                    message: AppStrings.textFieldEmpty,
                    type: .warning,
                    context: context,
                  );
                  return;
                }
                // 2. التأكد إن كلمة السر متطابقة
                if (passwordController.text != confirmPasswordController.text) {
                  NotificationBar.showNotification(
                    message: "The Password isn't match",
                    type: .warning,
                    context: context,
                  );
                  return;
                }

                // if (passwordController.text.isNotEmpty ||
                //     confirmPasswordController.text.isNotEmpty &&
                //         passwordController.text ==
                //             confirmPasswordController.text) {
                // 3. لو كله تمام، بنبعت الـ Event
                // مفيش داعي نبعت الإيميل هنا، الـ ViewModel هيسحبه من الـ State زي ما اتفقنا
                context.read<ForgetPasswordViewModel>().doIntent(
                  event: ResetPasswordEvent(
                    ResetPasswordRequest(password: passwordController.text),
                  ),
                );
                // }
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
      ),
    );
  }
}
