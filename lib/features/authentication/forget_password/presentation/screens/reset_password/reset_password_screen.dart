import 'package:exam_app_elevate/core/routes/routes_name.dart';
import 'package:exam_app_elevate/features/authentication/forget_password/presentation/view_model/forget_password_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/secure/flutter_secure_storage.dart';
import '../../../../../../core/notification/notification.dart';
import '../../../../../../core/values/app_keys.dart';
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
              controller: passwordController,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                // 1. التأكد إن الحقل مش فاضي
                if (value == null || value.isEmpty) {
                  return 'Password must not be empty';
                }

                // 2. التأكد من الطول (على الأقل 6 حروف)
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                  return 'Must contain at least one upper case letter';
                }

                // 4. التأكد من وجود رقم واحد على الأقل (Number)
                if (!RegExp(r'(?=.*[0-9])').hasMatch(value)) {
                  return 'Must contain at least one number';
                }

                // لو كله تمام
                return null;
              },
              hintText: AppStrings.hintNewPassword,
              labelText: AppStrings.labelNewPassword,
            ),
            ForgetPasswordTextField(
              controller: confirmPasswordController,
              textInputType: TextInputType.visiblePassword,
              validator: (value) {
                // 1. التأكد إن الحقل مش فاضي
                if (value == null || value.isEmpty) {
                  return 'Password must not be empty';
                }

                // 2. التأكد من الطول (على الأقل 6 حروف)
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                  return 'Must contain at least one upper case letter';
                }

                // 4. التأكد من وجود رقم واحد على الأقل (Number)
                if (!RegExp(r'(?=.*[0-9])').hasMatch(value)) {
                  return 'Must contain at least one number';
                }

                // لو كله تمام
                return null;
              },
              hintText: AppStrings.labelConfirmPassword,
              labelText: AppStrings.labelConfirmPassword,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () async {
                final cashedEmail = await CashingFlutterSecureStorage.getToken(
                  AppKeys.email,
                );

                if (passwordController.text.isNotEmpty ||
                    confirmPasswordController.text.isNotEmpty &&
                        passwordController.text ==
                            confirmPasswordController.text) {
                  context.read<ForgetPasswordViewModel>().doIntent(
                    event: ResetPasswordEvent(
                      ResetPasswordRequest(
                        password: passwordController.text,
                        email: cashedEmail ?? "",
                      ),
                    ),
                  );
                } else if (passwordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  NotificationBar.showNotification(
                    message: AppStrings.textFieldEmpty,
                    type: .warning,
                    context: context,
                  );
                } else if (passwordController.text !=
                    confirmPasswordController.text) {
                  NotificationBar.showNotification(
                    message: "The Password isn't match",
                    type: .warning,
                    context: context,
                  );
                }
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
