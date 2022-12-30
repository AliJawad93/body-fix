import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/data/firebase_food.dart';
import 'package:body_fix2/body%20fix/models/food_model.dart';
import 'package:body_fix2/body%20fix/presentation/food/admin/add_food.dart';
import 'package:body_fix2/body%20fix/presentation/food/user/widgets/card_food.dart';
import 'package:body_fix2/body%20fix/presentation/search/search.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../main.dart';
import '../../../services/shareprefs_keys.dart';
import '../../../services/user_role.dart';

class Food extends StatelessWidget {
  Food({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: const Text("Food"),
          leading: prefs.getInt(SharePrefsKeys.userRole) == UserRole.admin
              ? IconButton(
                  onPressed: () {
                    Get.to(() => const AddFood());
                  },
                  icon: const Icon(Icons.add))
              : const SizedBox(),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => Search(
                        searchByFood: true,
                      ));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Foods",
                  style: TextStyle(color: AppColors.black, fontSize: 23),
                ),
                StreamBuilder<List<FoodModel>>(
                    stream: FirebaseFood.getDataFood(),
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
                              itemCount: snapshot.data!.length,
                              physics: NeverScrollableScrollPhysics(),
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
                    }),
              ],
            )));
  }
}
