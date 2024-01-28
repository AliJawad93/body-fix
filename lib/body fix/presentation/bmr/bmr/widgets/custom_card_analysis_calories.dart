import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/colors.dart';
import '../../../widgets/custom_container.dart';

class CustomCardAnalysisCalories extends StatelessWidget {
  String imagePath;
  String titleCalculate;
  String title;
  CustomCardAnalysisCalories({
    Key? key,
    required this.imagePath,
    required this.titleCalculate,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        height: sqrt(Get.width + Get.height) * 4,
        width: sqrt(Get.width + Get.height) * 4,
        borderRadius: 10,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                imagePath,
                width: 50,
                color: AppColors.primary,
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(
              titleCalculate,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                  ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.black, fontWeight: FontWeight.normal),
            ),
          ],
        ));
  }
}
