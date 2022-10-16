import 'package:body_fix2/body%20fix/controller/SignUp_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';
import 'signup.dart';
import 'widgets/custom_signup_form_card.dart';
import 'widgets/custom_social_media_login_card.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "SignUp",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.white),
                ),
              ),
              CustomSignUpFormCard(),
              Row(
                children: [
                  Container(
                    height: 1.2,
                    width: Get.width * 0.30,
                    color: AppColors.white,
                  ),
                  const Text("      SignUp With      "),
                  Container(
                    height: 1.2,
                    width: Get.width * 0.30,
                    color: AppColors.white,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSocialMediaCard(
                    onTap: () {},
                    path: AppImagePath.google,
                    title: "Google",
                  ),
                  CustomSocialMediaCard(
                    onTap: () {},
                    path: AppImagePath.facebook,
                    title: "FackeBook",
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("have already an account ?"),
                  InkWell(
                      onTap: () {
                        Get.delete<SignUpController>();
                        Get.off(() => Login());
                      },
                      child: const Text(
                        " Login",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
