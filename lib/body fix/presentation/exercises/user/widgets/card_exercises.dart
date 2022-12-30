import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/string.dart';
import 'package:body_fix2/body%20fix/data/firebase_exercises.dart';
import 'package:body_fix2/body%20fix/models/exercises_model.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../main.dart';
import '../../../../services/general_services.dart';
import '../../../../services/shareprefs_keys.dart';

class CardExercises extends StatelessWidget {
  ExercisesModel exercisesModel;

  CardExercises({
    super.key,
    required this.exercisesModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        if (prefs.getInt(SharePrefsKeys.userRole) == 1) {
          return;
        }
        Get.bottomSheet(
          Container(
            height: Get.height * 0.3,
            color: AppColors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Are you sure you want to delete this?",
                    style: TextStyle(color: AppColors.black),
                  ),
                  SizedBox(
                    width: Get.width * 0.8,
                    child: CustomElevatedButton(
                        backgroundColor: AppColors.primary,
                        onPressed: () {
                          try {
                            FirebaseExercises.deleteDataExercises(
                                exercisesModel.title);
                            Get.back();

                            GeneralServices.snackBar(
                                title: "Successful",
                                message: "The post deleted");
                          } catch (e) {
                            GeneralServices.snackBar(
                                title: "Unsuccessful",
                                message: "There is Some thing wrong");
                          }
                        },
                        child: const Text("Delete")),
                  ),
                  SizedBox(
                    width: Get.width * 0.8,
                    child: CustomElevatedButton(
                        backgroundColor: AppColors.darkGray,
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Cancel")),
                  ),
                ]),
          ),
          isDismissible: true,
        );
      },
      child: CustomContainer(
          height: Get.height * 0.16,
          borderRadius: 10,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
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
                    errorWidget: (context, url, error) => const Icon(
                      Icons.fitness_center,
                      color: AppColors.darkGray,
                      size: 35,
                    ),
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
                        const Text(
                          "Burn: ",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 14, color: AppColors.black),
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
          )),
    );
  }
}
