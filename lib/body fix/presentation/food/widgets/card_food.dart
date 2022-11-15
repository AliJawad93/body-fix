import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/string.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/food_model.dart';

class CardFood extends StatelessWidget {
  FoodModel foodModel;

  CardFood({
    super.key,
    required this.foodModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        height: Get.height * 0.16,
        borderRadius: 10,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: foodModel.urlImage,
                  placeholder: (context, url) => Icon(
                    Icons.local_dining,
                    color: AppColors.darkGray,
                    size: 35,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.05,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    foodModel.title,
                    style:
                        const TextStyle(fontSize: 18, color: AppColors.black),
                  ),
                  Text(
                    "Type: ${foodModel.type}",
                    style: const TextStyle(
                        fontSize: 15, color: AppColors.darkGray),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "${foodModel.calories}\n${AppString.titleCalories}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.black),
                      ),
                      Text(
                        "${foodModel.fat}\n${AppString.titleFat}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.black),
                      ),
                      Text(
                        "${foodModel.carbs}\n${AppString.titleCarbs}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.black),
                      ),
                      Text(
                        "${foodModel.protein}\n${AppString.titleProtein}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.black),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
