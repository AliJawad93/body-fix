import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/auth.dart';
import '../../../auth/widgets/custom_text_form.dart';
import '../../../set_info_profile/widgets/custom_image_piker.dart';
import '../../../widgets/custom_body_cont.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../confirm_login.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  TextEditingController newEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text("Change Email"),
      ),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: sqrt((Get.height + Get.width))),
        height: Get.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextForm(
              controller: newEmail,
              hintText: 'New Email',
              prefixIcon: Icon(Icons.person_outline),
            ),
            CustomElevatedButton(
                onPressed: () {
                  Get.to(() => ConfirmLogin(changeFunction: () async {
                        await FirebaseAuthentication.updateEmail(
                            newEmail: newEmail.text);
                      }));
                },
                child: Text("Change"))
          ],
        ),
      ),
    );
  }
}
