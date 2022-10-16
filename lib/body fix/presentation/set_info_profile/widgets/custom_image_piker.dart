import 'dart:io';
import 'dart:math';

import 'package:body_fix2/body%20fix/controller/set_info_profile_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/services/piker_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImagePikker extends StatelessWidget {
  CustomImagePikker({Key? key}) : super(key: key);
  SetInfoProfileController setInfoProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: sqrt(Get.height + Get.width) * 2.5,
      width: sqrt(Get.height + Get.width) * 2.5,
      borderRadius: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GetBuilder<SetInfoProfileController>(builder: (controller) {
            if (setInfoProfileController.getPlatformFile == null) {
              return const Icon(
                Icons.person_outline,
                size: 30,
              );
            }

            return ClipOval(
                child: Image.file(
                    File(setInfoProfileController.getPlatformFile!.path!)));
          }),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () async {
                await setInfoProfileController.selectImage();
              },
              child: const CircleAvatar(
                radius: 11,
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
