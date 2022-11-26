import 'dart:math';

import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmLogin extends StatelessWidget {
  ConfirmLogin({super.key});
  TextEditingController t = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: Text("Confirm Login")),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: sqrt((Get.height + Get.width) * 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextForm(
              hintText: "Current Email",
              controller: t,
              prefixIcon: Icon(Icons.email_outlined),
            ),
            CustomTextForm(
              hintText: "Current password",
              controller: t,
              prefixIcon: Icon(Icons.lock_outline),
            ),
            CustomElevatedButton(onPressed: () {}, child: Text("Confirm")),
          ],
        ),
      ),
    );
  }
}
