import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/signup_controller.dart';
import '../../widgets/custom_container.dart';

class CustomTextForm extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  bool obscureText;
  void Function()? onPressedSuffixIcon;
  bool showVisibilityIcon;
  Widget prefixIcon;
  CustomTextForm({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.onPressedSuffixIcon,
    this.showVisibilityIcon = false,
    required this.prefixIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            suffixIcon: !showVisibilityIcon
                ? null
                : IconButton(
                    onPressed: onPressedSuffixIcon,
                    icon: obscureText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined))),
      ),
    );
  }
}
