import 'package:flutter/material.dart';

import 'package:body_fix2/body%20fix/core/utils/colors.dart';

class CustomContainer extends StatelessWidget {
  double? height;
  double? width;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  Widget child;
  double borderRadius;
  AlignmentGeometry? alignment;
  Color? color;
  CustomContainer({
    Key? key,
    this.height,
    this.width,
    this.alignment,
    this.padding,
    this.margin,
    this.color,
    required this.child,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
          )
        ],
      ),
      child: child,
    );
  }
}
