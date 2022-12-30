import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/data/auth.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/services/general_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text("Forget password"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: sqrt((Get.height + Get.width))),
          height: Get.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                AppImagePath.forgotPassword,
                width: Get.width * 0.7,
              ),
              CustomTextForm(
                controller: email,
                hintText: 'Enter your Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              CustomElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuthentication.resetPassword(
                          email: email.text);
                      GeneralServices.snackBar(
                          title: "Reset Password",
                          message:
                              "The link send to your Email please check your Email");
                    } catch (e) {
                      GeneralServices.snackBar(
                          title: "Error", message: "There is something wrong");
                    }
                  },
                  child: Text("Reset your password"))
            ],
          ),
        ),
      ),
    );
  }
}
