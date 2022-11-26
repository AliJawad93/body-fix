import 'package:body_fix2/body%20fix/controller/food_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/models/food_model.dart';
import 'package:body_fix2/body%20fix/presentation/food/admin/add_food.dart';
import 'package:body_fix2/body%20fix/presentation/food/user/widgets/card_food.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Food extends StatelessWidget {
  Food({Key? key}) : super(key: key);
  List m = [
    "All",
    "Fast Food",
    "Helthy Food",
    "Helthy Food",
    "Helthy Food",
    "Helthy Food",
    "Helthy Food"
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: Text("Food"),
          leading: IconButton(
              onPressed: () {
                Get.to(() => AddFood());
              },
              icon: Icon(Icons.add)),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<FoodController>(
              init: FoodController(),
              builder: (foodController) {
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
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            child: ChoiceChip(
                              selected:
                                  foodController.getSelectedIndex == index,
                              label: Text(m[index]),
                              selectedColor: AppColors.primary,
                              labelStyle: TextStyle(
                                  color:
                                      foodController.getSelectedIndex == index
                                          ? AppColors.white
                                          : AppColors.darkGray),
                              backgroundColor: AppColors.white,
                              shape: foodController.getSelectedIndex == index
                                  ? null
                                  : StadiumBorder(
                                      side: BorderSide(
                                          color: AppColors.lightGray)),
                              onSelected: (selected) {
                                if (selected) {
                                  foodController.setSelectedIndex(index);
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "Foods",
                      style: TextStyle(color: AppColors.black, fontSize: 23),
                    ),
                    CardFood(
                      foodModel: FoodModel(
                          title: "PIZZA",
                          type: "Fast Food",
                          urlImage: "",
                          calories: 123,
                          fat: 123,
                          carbs: 123,
                          protein: 123),
                    ),
                    CardFood(
                      foodModel: FoodModel(
                          title: "PIZZA",
                          type: "Fast Food",
                          urlImage: "",
                          calories: 123,
                          fat: 123,
                          carbs: 123,
                          protein: 123),
                    ),
                  ],
                );
              }),
        ));
  }
}
