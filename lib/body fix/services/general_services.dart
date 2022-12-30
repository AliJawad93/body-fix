import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralServices {
  static snackBar({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 4),
      colorText: AppColors.white,
      backgroundColor: AppColors.primary,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
