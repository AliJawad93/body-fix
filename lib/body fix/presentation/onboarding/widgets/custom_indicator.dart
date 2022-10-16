import 'package:body_fix2/body%20fix/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) {
          return Container(
            height: 100,
            width: 5,
            margin: const EdgeInsets.all(20),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.getOnboardingModels.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  height: controller.getCurrentIndex == index ? 25 : 13,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10)),
                );
              },
            ),
          );
        });
  }
}
