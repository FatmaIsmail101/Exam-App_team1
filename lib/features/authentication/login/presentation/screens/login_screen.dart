import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/text/text_theme_app.dart';
import '../../../../../core/utils/text_field_validation.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.data != null) {
            CustomSnackbar.showSnackBar(
              context: context,
              message: '${AppStrings.welcome} ${state.data!.user.username}',
              type: .success,
            );
          } else if (state.errorMessage != null) {
            CustomSnackbar.showSnackBar(
              context: context,
              message: state.errorMessage!,
              type:.failure,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state.isLoading;

          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              leadingWidth: 50,
              titleSpacing: 0,
              title: const Text(AppStrings.login),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validation.validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: AppStrings.email,
                        hintText: AppStrings.enterEmail,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    StatefulBuilder(
                      builder: (context, setState) {
                        return TextFormField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          validator: Validation.validatePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: AppStrings.password,
                            hintText: AppStrings.enterPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppColors.iconGrey,
                              ),
                              onPressed: () => setState(
                                    () => obscurePassword = !obscurePassword,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 12.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            StatefulBuilder(
                              builder: (context, setState) {
                                return Checkbox(
                                  value: rememberMe,
                                  activeColor: AppColors.primary,
                                  onChanged: (val) => setState(
                                        () => rememberMe = val ?? false,
                                  ),
                                );
                              },
                            ),
                            Text(
                              AppStrings.rememberMe,
                              style: TextThemeApp.medium20Black.copyWith(
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            RoutesName.forgetPassword,
                          ),
                          child: Text(
                            AppStrings.forgetPassword,
                            style: TextThemeApp.medium20Black.copyWith(
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 48.h),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              rememberMe: rememberMe,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        ),
                        child: isLoading
                            ? CircularProgressIndicator(color: AppColors.white)
                            : Text(
                          AppStrings.login,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.dontHaveAccount,
                            style: TextThemeApp.medium20Black.copyWith(
                              fontSize: 15.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              AppStrings.signUp,
                              style: TextThemeApp.medium20Black.copyWith(
                                fontSize: 15.sp,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}