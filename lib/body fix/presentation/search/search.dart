import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/data/firebase_exercises.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../data/firebase_food.dart';
import '../../models/exercises_model.dart';
import '../../models/food_model.dart';
import '../exercises/user/widgets/card_exercises.dart';
import '../food/user/widgets/card_food.dart';

class Search extends StatefulWidget {
  bool searchByFood;
  Search({super.key, required this.searchByFood});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String title = "NOT FOUND";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.01,
          ),
          Center(
            child: SizedBox(
              width: Get.width * 0.9,
              child: CustomTextForm(
                hintText: "Search by name",
                backgroundColor: AppColors.primary,
                onChanged: (data) {
                  setState(() {
                    title = data;
                  });
                },
              ),
            ),
          ),
          widget.searchByFood
              ? FutureBuilder<List<FoodModel>>(
                  future: FirebaseFood.searchDataFood(title),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.data!.isEmpty) {
                      return Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImagePath.search,
                            width: Get.width * 0.5,
                          ),
                          const Text(
                            " NOT FOUND",
                            style: TextStyle(color: AppColors.black),
                          )
                        ],
                      ));
                    }
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: Get.height * 0.755,
                        width: Get.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return CardFood(
                                foodModel: FoodModel(
                                  title: snapshot.data![index].title,
                                  type: snapshot.data![index].type,
                                  urlImage: snapshot.data![index].urlImage,
                                  calories: snapshot.data![index].calories,
                                  fat: snapshot.data![index].fat,
                                  carbs: snapshot.data![index].carbs,
                                  protein: snapshot.data![index].protein,
                                ),
                              );
                            }),
                      ),
                    );
                  })
              : FutureBuilder<List<ExercisesModel>>(
                  future: FirebaseExercises.searchDataExercises(title),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.data!.isEmpty) {
                      return Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImagePath.search,
                            width: Get.width * 0.5,
                          ),
                          const Text(
                            " NOT FOUND",
                            style: TextStyle(color: AppColors.black),
                          )
                        ],
                      ));
                    }
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: Get.height * 0.6291,
                        width: Get.width,
                        child: ListView.builder(
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
      ),
    );
  }
}
