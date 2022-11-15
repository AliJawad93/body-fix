import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/string.dart';
import 'package:body_fix2/body%20fix/models/exercises_model.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/food_model.dart';

class CardExercises extends StatelessWidget {
  ExercisesModel exercisesModel;

  CardExercises({
    super.key,
    required this.exercisesModel,
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
                  imageUrl: exercisesModel.urlImage,
                  placeholder: (context, url) => const Icon(
                    Icons.fitness_center,
                    color: AppColors.darkGray,
                    size: 35,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                    exercisesModel.title,
                    style:
                        const TextStyle(fontSize: 18, color: AppColors.black),
                  ),
                  Text(
                    "Type: ${exercisesModel.type}",
                    style: const TextStyle(
                        fontSize: 15, color: AppColors.darkGray),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Burn: ",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.black),
                      ),
                      Text(
                        "${exercisesModel.calories}\n${AppString.titleCalories}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.black),
                      ),
                      Text(
                        "${exercisesModel.time}\ntime",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.black),
                      ),
                      SizedBox(
                        width: Get.width * 0.1,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
