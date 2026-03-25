import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/theme/text/text_theme_app.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool rememberMe = false;
    bool obscurePassword = true;

    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Welcome ${state.login.user.username}',
                  style: TextThemeApp.medium20Black.copyWith(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: const Color(0xff4CAF50),
              ),
            );
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: TextThemeApp.medium20Black.copyWith(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: const Color(0xffCC1010),
              ),
            );
          }
        },
        builder: (context, state) {
          bool isLoading = state is LoginLoading;

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
              title: const Text('Login'),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email Field
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This Email is not valid';
                        }
                        final emailRegex = RegExp(
                          r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(value)) {
                          return 'This Email is not valid';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Password Field
                    StatefulBuilder(
                      builder: (context, setState) {
                        return TextFormField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: const Color(0xff535353),
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
                                  activeColor: const Color(0xff02369C),
                                  onChanged: (val) => setState(
                                    () => rememberMe = val ?? false,
                                  ),
                                );
                              },
                            ),
                            Text(
                              'Remember me',
                              style: TextThemeApp.medium20Black.copyWith(
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.forgetPassword,
                            );
                          },
                          child: Text(
                            'Forget password?',
                            style: TextThemeApp.medium20Black.copyWith(
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 48.h),

                    // Login Button
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
                          backgroundColor: const Color(0xff02369C),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffF9F9F9),
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
                            "Don't have an account? ",
                            style: TextThemeApp.medium20Black.copyWith(
                              fontSize: 15.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Sign up',
                              style: TextThemeApp.medium20Black.copyWith(
                                fontSize: 15.sp,
                                color: const Color(0xff02369C),
                                decoration: TextDecoration.underline,
                                decorationColor: const Color(0xff02369C),
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
