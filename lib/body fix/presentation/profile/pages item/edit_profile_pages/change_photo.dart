import 'dart:math';

import 'package:body_fix2/body%20fix/controller/set_info_profile_controller.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../main.dart';
import '../../../../data/firebase_storage.dart';
import '../../../../data/user_info.dart';
import '../../../../services/shareprefs_keys.dart';
import '../../../set_info_profile/widgets/custom_image_piker.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../confirm_login.dart';

class ChangePhoto extends StatefulWidget {
  const ChangePhoto({super.key});

  @override
  State<ChangePhoto> createState() => _ChangePhotoState();
}

class _ChangePhotoState extends State<ChangePhoto> {
  final SetInfoProfileController _setInfoProfileController =
      Get.put(SetInfoProfileController());
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text("Change Photo"),
      ),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: sqrt((Get.height + Get.width))),
        height: Get.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomImagePikker(),
            CustomElevatedButton(
                onPressed: () {
                  Get.to(() => ConfirmLogin(
                        changeFunction: () async {
                          String? urlImage =
                              await FirebaseStorageFiles.uploadImage(
                                  _setInfoProfileController.getPlatformFile);
                          if (urlImage == null) return;

                          await FirebaseUserInfo.updateVarable(
                              id: prefs.getString(SharePrefsKeys.id) ?? "",
                              key: "urlImage",
                              value: urlImage);

                          prefs.setString(SharePrefsKeys.urlImage, urlImage);
                        },
                      ));
                },
                child: Text("save"))
          ],
        ),
      ),
    );
  }
}
