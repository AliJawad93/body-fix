import 'package:body_fix2/body%20fix/controller/login_controller.dart';
import 'package:body_fix2/body%20fix/controller/signup_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/presentation/auth/login.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/home/home.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSignUpFormCard extends StatelessWidget {
  CustomSignUpFormCard({Key? key}) : super(key: key);

  SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: Get.height * 0.52,
      width: Get.width,
      padding: const EdgeInsets.all(10),
      borderRadius: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextForm(
            hintText: "Your e-mail",
            controller: signUpController.getEmail,
            obscureText: false,
            prefixIcon: const Icon(Icons.email_outlined),
          ),
          GetBuilder<SignUpController>(builder: (controller) {
            return CustomTextForm(
              hintText: "Your password",
              controller: signUpController.getPassword,
              obscureText: !signUpController.getVisibility,
              prefixIcon: const Icon(Icons.lock_outline),
              showVisibilityIcon: true,
              onPressedSuffixIcon: () {
                signUpController.changeVisibility();
              },
            );
          }),
          GetBuilder<SignUpController>(builder: (controller) {
            return CustomTextForm(
              hintText: "Your confirm password",
              controller: signUpController.getConfirmPassword,
              obscureText: !signUpController.getVisibility,
              prefixIcon: const Icon(Icons.lock_outline),
              showVisibilityIcon: true,
              onPressedSuffixIcon: () {
                signUpController.changeVisibility();
              },
            );
          }),
          CustomElevatedButton(
              margin: const EdgeInsets.symmetric(vertical: 10),
              onPressed: () {
                bool iss = signUpController.checkPasswordEqualConfirmPassword();
                if (!iss) {
                  print(" NO");
                  return;
                }
                Get.to(() => Home());

                print("YES");
              },
              child: const Text("Sign Up"))
        ],
      ),
    );
  }
}
