import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  void Function()? onPressed;
  Widget child;
  EdgeInsetsGeometry? margin;
  Color? backgroundColor;
  double? width;
  double? height;
  CustomElevatedButton(
      {Key? key,
      this.margin,
      required this.onPressed,
      required this.child,
      this.backgroundColor = AppColors.primary,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: height ?? Get.height * 0.08,
      width: width ?? Get.width,
      margin: margin,
      borderRadius: 10,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      ),
    );
  }
}
