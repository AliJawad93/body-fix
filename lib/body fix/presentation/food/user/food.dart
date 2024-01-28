import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/data/firebase_food.dart';
import 'package:body_fix2/body%20fix/models/food_model.dart';
import 'package:body_fix2/body%20fix/presentation/food/admin/add_food.dart';
import 'package:body_fix2/body%20fix/presentation/food/user/widgets/card_food.dart';
import 'package:body_fix2/body%20fix/presentation/search/search.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../services/shareprefs_keys.dart';
import '../../../services/user_role.dart';

class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);
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
            padding: EdgeInsets.all(sqrt(Get.height + Get.width) * 0.3)
                .copyWith(bottom: 0),
            child: StreamBuilder<List<FoodModel>>(
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
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        physics: const BouncingScrollPhysics(),
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
                  );
                })));
  }
}
