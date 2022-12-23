import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:body_fix2/body%20fix/controller/calculate_bmr_controller.dart';

import '../../../../core/utils/colors.dart';
import '../../../widgets/custom_elevated_button.dart';

class CustomIconCard extends StatelessWidget {
  String title;
  IconData icon;
  void Function()? onPressed;
  bool isMale;
  CustomIconCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.isMale,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        height: sqrt(Get.width + Get.height) * 4,
        width: sqrt(Get.width + Get.height) * 4,
        backgroundColor: isMale ? AppColors.primary : AppColors.white,
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isMale ? AppColors.white : AppColors.primary,
              size: 60,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: isMale ? AppColors.white : AppColors.black,
                  fontSize: 25),
            ),
          ],
        ));
  }
}
