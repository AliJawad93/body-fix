import 'dart:math';

import 'package:body_fix2/body%20fix/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomBodyOnboarding extends StatelessWidget {
  CustomBodyOnboarding({required this.onboardingModel, Key? key})
      : super(key: key);
  OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(
        height: Get.height * 0.12,
      ),
      SvgPicture.asset(
        onboardingModel.imagePath,
      ),
      Padding(
        padding: const EdgeInsets.all(12),
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "${onboardingModel.title}\n",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextSpan(
              text: onboardingModel.content,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ]),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: Get.height * 0.1,
      ),
    ]);
  }
}
