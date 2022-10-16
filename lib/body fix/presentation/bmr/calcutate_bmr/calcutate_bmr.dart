import 'dart:math';

import 'package:body_fix2/body%20fix/controller/calculate_bmr_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/string.dart';
import 'package:body_fix2/body%20fix/presentation/bmr/calcutate_bmr/widgets/custom_card_F_and_M.dart';
import 'package:body_fix2/body%20fix/presentation/bmr/calcutate_bmr/widgets/custom_card_calculation.dart';
import 'package:body_fix2/body%20fix/presentation/home/home.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculateBMR extends StatelessWidget {
  const CalculateBMR({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: const Text("Calculate BMR")),
      body: GetBuilder<CalculateBMRController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: sqrt(Get.height + Get.width) * 0.8,
                horizontal: sqrt(Get.height + Get.width)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconCard(
                        isMale: controller.getIsMale == true,
                        title: "Male",
                        icon: Icons.male,
                        onPressed: () {
                          controller.setIsMale(true);
                          print(controller.getIsMale);
                        }),
                    CustomIconCard(
                        isMale: controller.getIsMale == false,
                        title: "Female",
                        icon: Icons.female,
                        onPressed: () {
                          controller.setIsMale(false);
                          print(controller.getIsMale);
                        }),
                  ],
                ),
                CustomContainer(
                  height: Get.height * 0.2,
                  width: Get.width,
                  padding: const EdgeInsets.all(10),
                  borderRadius: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Heigth",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.black, fontSize: 25),
                      ),
                      Text(
                        "${controller.getHeight.toInt()} cm",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Slider(
                        min: 0.0,
                        max: 200.0,
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.primaryLight,
                        thumbColor: AppColors.white,
                        value: controller.getHeight,
                        onChanged: (value) {
                          controller.setHeigth(value);
                        },
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCardCalaulation(
                        title: "Width",
                        subTitle: "${controller.getWidth} kg",
                        onPressedRemove: () {
                          controller.decrementWidth();
                        },
                        onPressedAdd: () {
                          controller.incrementWidth();
                        }),
                    CustomCardCalaulation(
                        title: "Age",
                        subTitle: "${controller.getAge} year",
                        onPressedRemove: () {
                          controller.decrementAge();
                        },
                        onPressedAdd: () {
                          controller.incrementAge();
                        }),
                  ],
                ),
                CustomElevatedButton(
                    onPressed: () async {
                      double BMR;
                      if (controller.getIsMale == true) {
                        BMR = 5 +
                            (10 * controller.getWidth) +
                            (6.25 * controller.getHeight) -
                            (5 * controller.getAge);
                      } else {
                        BMR = -161 +
                            (10 * controller.getWidth) +
                            (6.25 * controller.getHeight) -
                            (5 * controller.getAge);
                      }

                      await controller.setPrefsDouble(
                          AppString.titleCalories, BMR);
                      await controller.setPrefsDouble(
                          AppString.titleFat, BMR * 0.3);
                      await controller.setPrefsDouble(
                          AppString.titleProtein, BMR * 0.4);
                      await controller.setPrefsDouble(
                          AppString.titleCarbs, BMR * 0.3);
                      controller.onInitPrefs();
                      Get.offAll(() => Home());
                    },
                    child: const Text("Calculate"))
              ],
            ),
          );
        },
      ),
    );
  }
}
