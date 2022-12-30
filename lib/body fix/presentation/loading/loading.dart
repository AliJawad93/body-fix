import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(AppImagePath.loading,
            width: sqrt(Get.width + Get.height) * 7,
            height: sqrt(Get.width + Get.height) * 7),
      ),
    );
  }
}
