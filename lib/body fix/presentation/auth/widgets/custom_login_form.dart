import 'package:body_fix2/body%20fix/controller/login_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoginFormCard extends StatelessWidget {
  CustomLoginFormCard({Key? key}) : super(key: key);

  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: Get.height * 0.45,
      width: Get.width,
      padding: const EdgeInsets.all(10),
      borderRadius: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextForm(
            hintText: "Your e-mail",
            controller: loginController.getEmail,
            obscureText: false,
            prefixIcon: const Icon(Icons.email_outlined),
          ),
          GetBuilder<LoginController>(builder: (controller) {
            return CustomTextForm(
              hintText: "Your password",
              controller: loginController.getPassword,
              obscureText: !loginController.getVisibility,
              prefixIcon: const Icon(Icons.lock_outline),
              showVisibilityIcon: true,
              onPressedSuffixIcon: () {
                loginController.changeVisibility();
              },
            );
          }),
          Text(
            "Forget Password ?",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: AppColors.darkGray),
          ),
          CustomElevatedButton(
              margin: const EdgeInsets.symmetric(vertical: 10),
              onPressed: () {
                Get.delete<LoginController>();
              },
              child: const Text("Login"))
        ],
      ),
    );
  }
}
