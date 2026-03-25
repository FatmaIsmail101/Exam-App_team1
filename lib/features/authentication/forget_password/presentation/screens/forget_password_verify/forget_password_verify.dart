import 'package:exam_app_elevate/features/authentication/forget_password/presentation/screens/forget_password_verify/widgets/pin_widget.dart';
import 'package:exam_app_elevate/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../core/values/app_strings.dart';
import '../../../../../../core/widgets/custom_snack_bar.dart';
import '../../../data/models/request_model/forget_password_request.dart';
import '../../view_model/forget_password_view_model_cubit.dart';
import '../../view_model/states/forget_password_event.dart';
import '../widgets/forget_password_block.dart';

@immutable
class ForgetPasswordVerify extends StatelessWidget {
  ForgetPasswordVerify({
    super.key,
    required this.pageController,
    required this.controller,
  });

  PinInputController pinInputController = PinInputController();
  final PageController pageController;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
      listener: (context, state) {
        talker.info("I'm BlocListener");
        if (state.verifyEmailState.data != null &&
            state.verifyEmailState.errorMessage == null &&
            state.verifyEmailState.isLoading == false) {
          CustomSnackbar.showSnackBar(
            message: state.verifyEmailState.data?.status ?? "",
            type: .success,
            context: context,
          );

          pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        } else if (state.verifyEmailState.data == null &&
            state.verifyEmailState.errorMessage != null &&
            state.verifyEmailState.isLoading == false) {
          CustomSnackbar.showSnackBar(
            message: state.verifyEmailState.errorMessage ?? "",
            type: .failure,
            context: context,
          );
          pinInputController.clear();
        }
      },
      listenWhen: (previous, current) {
        return previous.verifyEmailState != current.verifyEmailState ||
            previous.forgetePasswordState != current.forgetePasswordState;
      },
      child: Column(
        // spacing: 20.h,
        children: [
          ForgetPasswordBlock(
            title: AppStrings.forgetPassword,
            content: AppStrings.passwordScreenDescription,
          ),
          SizedBox(height: 32.h),
          PinWidget(
            pageController: pageController,
            pinController: pinInputController,
          ),
          SizedBox(height: 32.h),
          BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
            buildWhen: (previous, current) =>
                previous.timerValue != current.timerValue ||
                previous.isResendEnabled != current.isResendEnabled,
            builder: (context, state) {
              // ممكن تخلي الـ 600 دي متغير عندك أو ثابت
              const int totalTime = 600;
              bool isHalfTime = state.timerValue! <= (totalTime / 2);
              talker.info("I'm BlocBuilder");
              return Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: AppStrings.verifyText,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Color(0xff0F0F0F),
                      ),
                    ),
                    TextSpan(
                      text: state.timerValue == 0
                          ? AppStrings.resend
                          : formatDuration(state.timerValue ?? 0),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: isHalfTime
                            ? Color(0xffCC1010)
                            : Color(0xff02369C),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color(0xff02369C),
                        // تأكيد لون الخط نفسه
                        decorationStyle: TextDecorationStyle.solid,
                        height: 6,
                      ),
                      // هنا تقدر تضيف الـ recognizer عشان لما يضغط يعيد الإرسال
                      recognizer: state.isResendEnabled == true
                          ? (TapGestureRecognizer()
                              ..onTap = () {
                                context
                                    .read<ForgetPasswordViewModel>()
                                    .doIntent(
                                      event: SendEmailEvent(
                                        ForgetPasswordRequest(
                                          email: controller.text,
                                        ),
                                      ),
                                    );
                              })
                          : null,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String formatDuration(int totalSeconds) {
    // بنقسم على 60 عشان نعرف فيه كام دقيقة
    int minutes = totalSeconds ~/ 60;

    // بنجيب الباقي من القسمة عشان نعرف الثواني
    int seconds = totalSeconds % 60;

    // padLeft(2, '0') معناها: لو الرقم خانة واحدة (مثلاً 5) حط جنبه 0 عشان يبقى 05
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }
}
