import 'package:body_fix2/body%20fix/controller/onboarding_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({Key? key}) : super(key: key);
  OnboardingController onboardingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onboardingController.nextPage();
      },
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: AppColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.blue],
          ),
        ),
        child: Text(onboardingController.getCurrentIndex ==
                onboardingController.getOnboardingModels.length - 1
            ? AppString.start
            : AppString.next),
      ),
    );
  }
}
