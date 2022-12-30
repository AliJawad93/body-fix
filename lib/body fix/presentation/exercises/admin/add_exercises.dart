import 'dart:io';
import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/data/firebase_exercises.dart';
import 'package:body_fix2/body%20fix/models/exercises_model.dart';
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
  bool isLoading = false;
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
              onPressed: () async {
                try {
                  setState(() {
                    isLoading = true;
                  });
                  String? urlImage =
                      await FirebaseStorageFiles.uploadImage(_platformFile);
                  ExercisesModel exercisesModel = ExercisesModel(
                      title: nameExercises.text,
                      type: type.text,
                      urlImage: urlImage ?? "",
                      calories: double.parse(calories.text),
                      time: time.text);
                  FirebaseExercises.sendDataExercises(exercisesModel);
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
          ? Loading()
          : SingleChildScrollView(
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
                    CustomTextForm(
                      hintText: "Type Exercises",
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
