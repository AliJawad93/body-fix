import 'dart:math';

import 'package:body_fix2/body%20fix/data/auth.dart';
import 'package:body_fix2/body%20fix/data/user_info.dart';
import 'package:body_fix2/body%20fix/services/shareprefs_keys.dart';
import 'package:body_fix2/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/general_services.dart';
import '../../../auth/widgets/custom_text_form.dart';
import '../../../set_info_profile/widgets/custom_image_piker.dart';
import '../../../widgets/custom_body_cont.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../confirm_login.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({super.key});

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text("Change Name"),
      ),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: sqrt((Get.height + Get.width))),
        height: Get.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextForm(
              controller: name,
              hintText: 'New name',
              prefixIcon: Icon(Icons.person_outline),
            ),
            CustomElevatedButton(
                onPressed: () {
                  Get.to(() => ConfirmLogin(
                        changeFunction: () async {
                          try {
                            await FirebaseUserInfo.updateVarable(
                                id: prefs.getString(SharePrefsKeys.id) ?? "",
                                key: "name",
                                value: name.text);

                            prefs.setString(SharePrefsKeys.name, name.text);
                          } catch (e) {
                            GeneralServices.snackBar(
                                title: "Error", message: e.toString());
                          }
                        },
                      ));
                },
                child: Text("Change"))
          ],
        ),
      ),
    );
  }
}
