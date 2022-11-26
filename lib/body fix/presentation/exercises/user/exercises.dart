import 'dart:math';

import 'package:body_fix2/body%20fix/controller/Exercises_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/models/exercises_model.dart';
import 'package:body_fix2/body%20fix/presentation/exercises/admin/add_exercises.dart';
import 'package:body_fix2/body%20fix/presentation/exercises/user/widgets/card_exercises.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Exercises extends StatelessWidget {
  Exercises({Key? key}) : super(key: key);
  List m = [
    "All",
    "Leg",
    "Arm",
    "Helthy Exercises",
    "Helthy Exercises",
    "Helthy Exercises",
    "Helthy Exercises"
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: const Text("Exercises"),
          leading: IconButton(
              onPressed: () {
                Get.to(() => AddExercises());
              },
              icon: Icon(Icons.add)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(sqrt(Get.height + Get.width) * 0.3),
          child: GetBuilder<ExercisesController>(
              init: ExercisesController(),
              builder: (ExercisesController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height * 0.1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: m.length,
                        itemBuilder: (cxt, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            child: ChoiceChip(
                              selected:
                                  ExercisesController.getSelectedIndex == index,
                              label: Text(m[index]),
                              selectedColor: AppColors.primary,
                              labelStyle: TextStyle(
                                  color: ExercisesController.getSelectedIndex ==
                                          index
                                      ? AppColors.white
                                      : AppColors.darkGray),
                              backgroundColor: AppColors.white,
                              shape:
                                  ExercisesController.getSelectedIndex == index
                                      ? null
                                      : StadiumBorder(
                                          side: BorderSide(
                                              color: AppColors.lightGray)),
                              onSelected: (selected) {
                                if (selected) {
                                  ExercisesController.setSelectedIndex(index);
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const Text(
                      "Exercisess",
                      style: TextStyle(color: AppColors.black, fontSize: 23),
                    ),
                    CardExercises(
                      exercisesModel: ExercisesModel(
                          title: "Running",
                          type: "leg",
                          urlImage: "",
                          calories: 123,
                          time: 12),
                    ),
                    CardExercises(
                      exercisesModel: ExercisesModel(
                          title: "Running",
                          type: "leg",
                          urlImage: "",
                          calories: 123,
                          time: 12),
                    ),
                  ],
                );
              }),
        ));
  }
}
