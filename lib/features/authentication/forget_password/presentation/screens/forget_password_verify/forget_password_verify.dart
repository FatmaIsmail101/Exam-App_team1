import 'package:exam_app_elevate/features/authentication/forget_password/presentation/screens/forget_password_verify/widgets/pin_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../core/notification/notification.dart';
import '../../../../../../core/values/app_strings.dart';
import '../../../data/models/forget_password/forget_password_request.dart';
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
    final vm = context.read<ForgetPasswordViewModel>();
    final response = vm.state.verifyEmailState.data;
    return BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
      listener: (context, state) {
        if (state.verifyEmailState.data != null &&
            state.verifyEmailState.errorMessage == null &&
            state.verifyEmailState.isLoading == false) {
          NotificationBar.showNotification(
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
          NotificationBar.showNotification(
            message: state.verifyEmailState.errorMessage ?? "",
            type: .failure,
            context: context,
          );
          pinInputController.clear();
        }
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
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.verifyText,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Color(0xff0F0F0F),
                  ),
                ),
                TextSpan(
                  text: AppStrings.resend,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Color(0xff02369C),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xff02369C),
                    // تأكيد لون الخط نفسه
                    decorationStyle: TextDecorationStyle.solid,
                    height: 6,
                  ),
                  // هنا تقدر تضيف الـ recognizer عشان لما يضغط يعيد الإرسال
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.read<ForgetPasswordViewModel>().doIntent(
                        event: SendEmailEvent(
                          ForgetPasswordRequest(email: controller.text),
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// .then((value) {
//   final viewModel = context
//       .watch<ForgetPasswordViewModel>();
//   if (viewModel.state.authBaseResponse.data != null &&
//       viewModel.state.authBaseResponse.errorMessage ==
//           null &&
//       viewModel.state.authBaseResponse.isLoading ==
//           false) {
//     NotificationBar.showNotification(
//       message:
//           viewModel.state.authBaseResponse.data?.info ??
//           "",
//       type: .success, // استخدمي اسم الـ Enum الصح عندك
//       context: context,
//     );
//   } else if (viewModel.state.authBaseResponse.data ==
//           null &&
//       viewModel.state.authBaseResponse.errorMessage !=
//           null &&
//       viewModel.state.authBaseResponse.isLoading ==
//           false) {
//     NotificationBar.showNotification(
//       message:
//           viewModel
//               .state
//               .authBaseResponse
//               .errorMessage ??
//           "",
//       type: .failure,
//       context: context,
//     );
//   }
// });
