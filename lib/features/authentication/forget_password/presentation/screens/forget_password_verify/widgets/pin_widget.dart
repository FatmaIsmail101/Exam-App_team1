import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../data/models/verify_email/verify_email_request.dart';
import '../../../view_model/forget_password_view_model_cubit.dart';
import '../../../view_model/states/forget_password_event.dart';

@immutable
class PinWidget extends StatelessWidget {
  PinWidget({
    super.key,
    required this.pageController,
    required this.pinController,
  });

  final PageController pageController;
  final PinInputController pinController;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
      builder: (context, state) {
        bool isError = state.verifyEmailState.errorMessage != null;
        final hasError = state.verifyEmailState.errorMessage != null;
        return Stack(
          children: [
            Container(
              width: 300.w,
              height: 70.h,
              color: isError ? Color(0x33000000) : null,
              child: MaterialPinField(
                errorBuilder: (errorText) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: isError
                      ? [
                          Icon(Icons.error, color: Colors.red, size: 16),
                          SizedBox(width: 4),
                          Text(
                            errorText ?? 'Error',
                            style: TextStyle(color: Colors.red),
                          ),
                        ]
                      : [],
                ),
                length: 6,
                errorText: hasError ? "Invalid code, please try again" : null,
                onCompleted: (pin) {
                  context.read<ForgetPasswordViewModel>().doIntent(
                    event: VerifyEmailEvent(VerifyEmailRequest(code: pin)),
                  );
                },
                obscureText: true,
                autoFocus: true,
                pinController: pinController,
                onChanged: (value) {},
                theme: MaterialPinTheme(
                  shape: MaterialPinShape.outlined,
                  // cellSize: Size(20.w, 68.h),
                  borderRadius: BorderRadius.circular(10.r),
                  fillColor: Color(0xffDFE7F7),
                  borderColor: isError ? Color(0xffCC1010) : Color(0xffDFE7F7),
                  cursorColor: Color(0xff02369C),
                  animateCursor: true,
                  animationDuration: Duration(milliseconds: 300),
                  animationCurve: Curves.easeIn,
                  completeBorderColor: Color(0xffDFE7F7),
                  completeTextStyle: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: .w500,
                  ),

                  completeFillColor: Color(0xffDFE7F7),
                  errorBorderColor: Color(0xffCC1010),
                  errorBorderWidth: 1.w,
                  errorFillColor: Color(0xffF9F9F9),
                  focusedFillColor: Color(0xffDFE7F7),
                  errorColor: Color(0xffDFE7F7),
                  borderWidth: 1.w,
                  enableErrorShake: true,
                  filledBorderColor: Color(0xffDFE7F7),
                  focusedBorderColor: Color(0xffDFE7F7),
                  textStyle: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: .w500,
                  ),
                  filledFillColor: Color(0xffDFE7F7),
                  obscuringCharacter: "*",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
