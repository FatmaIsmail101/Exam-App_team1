import 'package:exam_app_elevate/features/authentication/register/peresenation/view_model/cubit/register_view_model.dart';
import 'package:exam_app_elevate/features/authentication/register/peresenation/view_model/state/register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/di/di.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/theme/text/text_theme_app.dart';
import '../../data/models/register_request_model.dart';

import '../view_model/state/register_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  RegisterViewModel viewModel = getIt.get<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocConsumer<RegisterViewModel, RegisterState>(
        listener: (context, state) {
          if (state.registerState.data != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Account created successfully',
                  style: TextThemeApp.medium20Black.copyWith(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: const Color(0xff4CAF50),
              ),
            );

            Navigator.pushReplacementNamed(context, RoutesName.login);
          } else if (state.registerState.errorMessage != null ||
              state.registerState.errorMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.registerState.errorMessage!,
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
          bool isLoading = state.registerState.isLoading;

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
              title: const Text('Sign up'),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Username
                    TextFormField(
                      controller: _usernameController,
                      validator: (value) =>
                          value!.isEmpty ? 'Username is required' : null,
                      decoration: const InputDecoration(
                        labelText: 'User name',
                        hintText: 'Enter your user name',
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// First & Last Name
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstNameController,
                            validator: (value) =>
                                value!.isEmpty ? 'First name required' : null,
                            decoration: const InputDecoration(
                              labelText: 'First name',
                              hintText: 'Enter first name',
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormField(
                            controller: _lastNameController,
                            validator: (value) =>
                                value!.isEmpty ? 'Last name required' : null,
                            decoration: const InputDecoration(
                              labelText: 'Last name',
                              hintText: 'Enter last name',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    /// Email
                    TextFormField(
                      controller: _emailController,
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
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'At least 6 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xff535353),
                          ),
                          onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// Confirm Password
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        hintText: 'Confirm password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xff535353),
                          ),
                          onPressed: () => setState(
                            () => _obscureConfirmPassword =
                                !_obscureConfirmPassword,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// Phone
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value!.isEmpty ? 'Phone is required' : null,
                      decoration: const InputDecoration(
                        labelText: 'Phone number',
                        hintText: 'Enter phone number',
                      ),
                    ),
                    SizedBox(height: 48.h),

                    /// Signup Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                viewModel.doIntent(
                                  RegisterWithEmailAndPasswordEvent(
                                    requestModel: RegisterRequestModel(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      username: _usernameController.text,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      phone: _phoneController.text,
                                    ),
                                  ),
                                );
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
                            : const Text(
                                'Signup',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffF9F9F9),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// Login Redirect
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextThemeApp.medium20Black.copyWith(
                            fontSize: 15.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.login);
                          },
                          child: Text(
                            'Login',
                            style: TextThemeApp.medium20Black.copyWith(
                              fontSize: 15.sp,
                              color: const Color(0xff02369C),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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
