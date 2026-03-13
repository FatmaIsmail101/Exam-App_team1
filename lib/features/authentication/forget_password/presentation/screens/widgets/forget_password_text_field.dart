import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class ForgetPasswordTextField extends StatefulWidget {
  const ForgetPasswordTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.validator,
    required this.controller,
    this.textInputType,
  });

  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? textInputType;

  @override
  State<ForgetPasswordTextField> createState() =>
      _ForgetPasswordTextFieldState();
}

class _ForgetPasswordTextFieldState extends State<ForgetPasswordTextField> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      style: theme.textTheme.bodyMedium?.copyWith(
        fontSize: 16.sp,
        fontWeight: .w500,
      ),
      controller: widget.controller,
      keyboardType: widget.textInputType,
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
        labelText: widget.labelText,
        hintText: widget.hintText,
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
      validator: widget.validator,
    );
  }
}
