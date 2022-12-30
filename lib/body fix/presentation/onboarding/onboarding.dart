import 'package:body_fix2/body%20fix/controller/onboarding_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/presentation/onboarding/widgets/custom_boy_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/custom_floating_action.dart';
import 'widgets/custom_indicator.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: CustomFloatingActionButton(),
            body: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        AppColors.primary,
                        AppColors.blue,
                      ],
                    ),
                    image: DecorationImage(
                      image: AssetImage(AppImagePath.bg),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                PageView.builder(
                  controller: controller.getPageController,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.getOnboardingModels.length,
                  onPageChanged: (index) =>
                      controller.updateCurrentIndex(index),
                  itemBuilder: (context, index) {
                    return CustomBodyOnboarding(
                        onboardingModel: controller.getOnboardingModels[index]);
                  },
                ),
                const CustomIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
