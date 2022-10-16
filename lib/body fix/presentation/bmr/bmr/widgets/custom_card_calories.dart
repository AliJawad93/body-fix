import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/colors.dart';
import '../../../widgets/custom_container.dart';

class CustomCardCalories extends StatelessWidget {
  String imagePath;
  String titleCalculate;
  String title;
  CustomCardCalories({
    Key? key,
    required this.imagePath,
    required this.titleCalculate,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        height: Get.height * 0.16,
        padding: EdgeInsets.all(20),
        borderRadius: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              imagePath,
              width: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleCalculate,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.black, fontSize: 30),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(
              width: Get.width * 0.05,
            )
          ],
        ));
  }
}
