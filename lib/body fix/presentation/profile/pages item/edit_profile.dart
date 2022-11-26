import 'dart:math';

import 'package:body_fix2/body%20fix/controller/set_info_profile_controller.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/profile/pages%20item/confirm_login.dart';
import 'package:body_fix2/body%20fix/presentation/set_info_profile/widgets/custom_image_piker.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  TextEditingController t = TextEditingController();
  SetInfoProfileController setInfoProfileController =
      Get.put(SetInfoProfileController());
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: sqrt((Get.height + Get.width) * 2)),
          height: Get.height * 0.6,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomImagePikker(),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                CustomTextForm(
                  controller: t,
                  hintText: 'Ali Jawad Oribe',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                CustomTextForm(
                  controller: t,
                  hintText: 'example@gmail.com',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                CustomElevatedButton(
                    onPressed: () {
                      Get.to(() => ConfirmLogin());
                    },
                    child: Text("save"))
              ]),
        ),
      ),
    );
  }
}
