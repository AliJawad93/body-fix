import 'dart:io';
import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/data/firebase_food.dart';
import 'package:body_fix2/body%20fix/models/food_model.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/home/home.dart';
import 'package:body_fix2/body%20fix/presentation/loading/loading.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:body_fix2/body%20fix/services/piker_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/firebase_storage.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  TextEditingController nameFood = TextEditingController();
  String calories = "";
  String fat = "";
  String carbs = "";
  String protein = "";
  TextEditingController type = TextEditingController();
  bool isLoading = false;
  PlatformFile? _platformFile;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text("Add Food"),
        actions: [
          Align(
            alignment: Alignment.center,
            child: CustomElevatedButton(
              backgroundColor: AppColors.white,
              onPressed: () async {
                try {
                  setState(() {
                    isLoading = true;
                  });
                  String? urlImage =
                      await FirebaseStorageFiles.uploadImage(_platformFile);
                  FoodModel foodModel = FoodModel(
                      title: nameFood.text,
                      type: type.text,
                      urlImage: urlImage ?? "",
                      calories: calories,
                      fat: fat,
                      carbs: carbs,
                      protein: protein);
                  FirebaseFood.sendDataFood(foodModel);
                  setState(() {
                    isLoading = false;
                  });
                  Get.offAll(Home());
                } catch (e) {
                  Get.snackbar("Error", e.toString(),
                      backgroundColor: AppColors.white);
                }
              },
              width: Get.width * 0.15,
              height: Get.height * 0.05,
              child: Text(
                "add",
                style: TextStyle(
                    color: AppColors.primary, fontSize: Get.width * 0.03),
              ),
            ),
          )
        ],
      ),
      body: isLoading
          ? const Loading()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(sqrt((Get.height + Get.width) * 0.3)),
                child: Column(
                  children: [
                    CustomTextForm(
                        hintText: "Name Food",
                        controller: nameFood,
                        prefixIcon: Icon(Icons.local_dining)),
                    CustomTextForm(
                      hintText: "Calories",
                      onChanged: (value) {
                        setState(() {
                          calories = value;
                          fat =
                              (double.parse(calories) * 0.3).toStringAsFixed(0);
                          carbs =
                              (double.parse(calories) * 0.3).toStringAsFixed(0);
                          protein =
                              (double.parse(calories) * 0.4).toStringAsFixed(0);
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.25,
                          child: CustomContainer(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              calories.isEmpty ? "Fat" : fat,
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.25,
                          child: CustomContainer(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              calories.isEmpty ? "Carbs" : carbs,
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.25,
                          child: CustomContainer(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              calories.isEmpty ? "Protein" : protein,
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextForm(
                      hintText: "Type Food",
                      controller: type,
                    ),
                    if (_platformFile != null)
                      CustomContainer(
                          margin: EdgeInsets.all(20),
                          child: Image.file(File(_platformFile!.path!))),
                    CustomElevatedButton(
                      backgroundColor: AppColors.primary,
                      onPressed: () async {
                        _platformFile = await PickerImageService.selectImage();
                        setState(() {});
                      },
                      child: const Text(
                        "Upload image",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
