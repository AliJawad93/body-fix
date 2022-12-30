import 'dart:math';

import 'package:body_fix2/body%20fix/controller/set_info_profile_controller.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/profile/pages%20item/confirm_login.dart';
import 'package:body_fix2/body%20fix/presentation/profile/pages%20item/edit_profile_pages/change_email.dart';
import 'package:body_fix2/body%20fix/presentation/profile/pages%20item/edit_profile_pages/change_name.dart';
import 'package:body_fix2/body%20fix/presentation/profile/pages%20item/edit_profile_pages/change_password.dart';
import 'package:body_fix2/body%20fix/presentation/profile/pages%20item/edit_profile_pages/change_photo.dart';
import 'package:body_fix2/body%20fix/presentation/profile/widgets/card_item_profile.dart';
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
      appBar: AppBar(title: const Text("Edit Profile")),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: sqrt((Get.height + Get.width))),
          height: Get.height * 0.6,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardItemProfile(
                    title: "Change Photo",
                    iconData: Icons.image_outlined,
                    onTap: () {
                      Get.to(() => const ChangePhoto());
                    }),
                CardItemProfile(
                    title: "Change Name",
                    iconData: Icons.title_outlined,
                    onTap: () {
                      Get.to(() => const ChangeName());
                    }),
                CardItemProfile(
                    title: "Change Email",
                    iconData: Icons.email_outlined,
                    onTap: () {
                      Get.to(() => const ChangeEmail());
                    }),
                CardItemProfile(
                    title: "Change Password",
                    iconData: Icons.lock_outline,
                    onTap: () {
                      Get.to(() => const ChangePassword());
                    }),
              ]),
        ),
      ),
    );
  }
}
