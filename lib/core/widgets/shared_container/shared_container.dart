import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedContainer extends StatelessWidget {
  const SharedContainer({
    super.key,
    this.width = 344,
    this.height = 80,
    this.color,
    this.radius = 10,
    this.child,
    this.shadow = false,
    this.horizontal,
    this.vertical,
    this.alignment,
  });

  final double width;
  final double height;
  final Color? color;
  final double? radius;
  final Widget? child;
  final bool shadow;
  final double? horizontal;
  final double? vertical;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 16.w,
        vertical: vertical ?? 16.h,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius?.r ?? 10.r),
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: Color(0xff1E1E1E),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
                BoxShadow(
                  color: Color(0xffFFFFFF),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
