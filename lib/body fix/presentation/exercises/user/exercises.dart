import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/data/firebase_exercises.dart';
import 'package:body_fix2/body%20fix/models/exercises_model.dart';
import 'package:body_fix2/body%20fix/presentation/exercises/admin/add_exercises.dart';
import 'package:body_fix2/body%20fix/presentation/exercises/user/widgets/card_exercises.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/services/shareprefs_keys.dart';
import 'package:body_fix2/body%20fix/services/user_role.dart';
import 'package:body_fix2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/images_path.dart';
import '../../search/search.dart';

class Exercises extends StatelessWidget {
  Exercises({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: const Text("Exercises"),
          leading: prefs.getInt(SharePrefsKeys.userRole) == UserRole.admin
              ? IconButton(
                  onPressed: () {
                    Get.to(() => const AddExercises());
                  },
                  icon: const Icon(Icons.add))
              : const SizedBox(),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => Search(
                        searchByFood: false,
                      ));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(sqrt(Get.height + Get.width) * 0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Exercisess",
                  style: TextStyle(color: AppColors.black, fontSize: 23),
                ),
                StreamBuilder<List<ExercisesModel>>(
                    stream: FirebaseExercises.getDataExercises(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.data!.isEmpty) {
                        return SizedBox(
                          height: Get.height * 0.6,
                          width: Get.width,
                          child: Align(
                            child: SvgPicture.asset(
                              AppImagePath.noData,
                              width: sqrt(Get.width + Get.height) * 4,
                            ),
                          ),
                        );
                      }
                      return Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                ExercisesModel exercisesModel = ExercisesModel(
                                    title: snapshot.data![index].title,
                                    type: snapshot.data![index].type,
                                    urlImage: snapshot.data![index].urlImage,
                                    calories: snapshot.data![index].calories,
                                    time: snapshot.data![index].time);
                                return CardExercises(
                                  exercisesModel: exercisesModel,
                                );
                              }),
                        ),
                      );
                    }),
              ],
            )));
  }
}
