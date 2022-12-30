import 'dart:math';

import 'package:body_fix2/body%20fix/data/auth.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/user_info.dart';
import '../../../auth/widgets/custom_text_form.dart';
import '../../../set_info_profile/widgets/custom_image_piker.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../confirm_login.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: sqrt((Get.height + Get.width))),
        height: Get.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextForm(
              controller: newPassword,
              hintText: 'New Password',
              prefixIcon: Icon(Icons.person_outline),
            ),
            CustomElevatedButton(
                onPressed: () {
                  Get.to(() => ConfirmLogin(changeFunction: () async {
                        await FirebaseAuthentication.updatePassword(
                            newPassword: newPassword.text);
                      }));
                },
                child: Text("Change"))
          ],
        ),
      ),
    );
  }
}
