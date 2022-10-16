import 'dart:ffi';
import 'dart:math';

import 'package:body_fix2/body%20fix/controller/calculate_bmr_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/core/utils/string.dart';
import 'package:body_fix2/body%20fix/presentation/bmr/calcutate_bmr/calcutate_bmr.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../widgets/custom_body_cont.dart';
import 'widgets/custom_card_analysis_calories.dart';
import 'widgets/custom_card_calories.dart';

class BMR extends StatelessWidget {
  BMR({super.key});
  CalculateBMRController calculateBMRController =
      Get.put(CalculateBMRController());
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text("BMR"),
      ),
      body: GetBuilder<CalculateBMRController>(
          init: CalculateBMRController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(sqrt(Get.height + Get.width) * 0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomCardCalories(
                      imagePath: AppImagePath.fire,
                      titleCalculate: "${controller.getCalories} /day",
                      title: AppString.titleCalories),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCardAnalysisCalories(
                          imagePath: AppImagePath.fat,
                          titleCalculate: controller.getFat,
                          title: AppString.titleFat),
                      CustomCardAnalysisCalories(
                          imagePath: AppImagePath.starch,
                          titleCalculate: controller.getCarbs,
                          title: AppString.titleCarbs),
                    ],
                  ),
                  CustomCardAnalysisCalories(
                      imagePath: AppImagePath.protein,
                      titleCalculate: controller.getProtein,
                      title: AppString.titleProtein),
                  CustomElevatedButton(
                      onPressed: () {
                        Get.to(() => CalculateBMR());
                      },
                      child: Text("Calculate BMR"))
                ],
              ),
            );
          }),
    );
  }
}
