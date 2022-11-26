import 'dart:io';
import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:body_fix2/body%20fix/services/piker_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExercises extends StatefulWidget {
  const AddExercises({super.key});

  @override
  State<AddExercises> createState() => _AddExercisesState();
}

class _AddExercisesState extends State<AddExercises> {
  TextEditingController nameExercises = TextEditingController();
  TextEditingController calories = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController type = TextEditingController();
  PlatformFile? _platformFile;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text("Add Exercises"),
        actions: [
          Align(
            alignment: Alignment.center,
            child: CustomElevatedButton(
              backgroundColor: AppColors.white,
              onPressed: () {},
              width: Get.width * 0.15,
              height: Get.height * 0.05,
              child: const Text(
                "add",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sqrt((Get.height + Get.width) * 0.3)),
          child: Column(
            children: [
              CustomTextForm(
                  hintText: "Name Exercises",
                  controller: nameExercises,
                  prefixIcon: Icon(Icons.fitness_center)),
              CustomTextForm(
                hintText: "Calories",
                controller: calories,
              ),
              CustomTextForm(
                hintText: "Time",
                controller: time,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.6,
                    child: CustomTextForm(
                      hintText: "Type Exercises",
                      controller: type,
                    ),
                  ),
                  CustomElevatedButton(
                    backgroundColor: AppColors.primary,
                    onPressed: () {},
                    width: Get.width * 0.3,
                    child: const Text(
                      "Select",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ],
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
