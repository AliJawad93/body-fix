import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/core/utils/string.dart';
import 'package:body_fix2/body%20fix/models/onboarding_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../presentation/auth/login.dart';

class OnboardingController extends GetxController {
  List<OnboardingModel> onboardingModels = [
    OnboardingModel(
        imagePath: AppImagePath.onBoarding1,
        title: AppString.onBoardingTitle1,
        content: AppString.onBoardingContent1),
    OnboardingModel(
        imagePath: AppImagePath.onBoarding2,
        title: AppString.onBoardingTitle2,
        content: AppString.onBoardingContent2),
    OnboardingModel(
        imagePath: AppImagePath.onBoarding3,
        title: AppString.onBoardingTitle3,
        content: AppString.onBoardingContent3),
  ];
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  get getPageController => pageController;
  updateCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  nextPage() {
    if (getCurrentIndex + 1 <= getOnboardingModels.length - 1) {
      pageController.animateToPage(
        getCurrentIndex + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    } else {
      Get.off(() => Login());
    }
    update();
  }

  int get getCurrentIndex => currentIndex;

  List<OnboardingModel> get getOnboardingModels => onboardingModels;
}
