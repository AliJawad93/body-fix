import 'package:body_fix2/body%20fix/controller/login_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_social_media_login_card.dart';
import 'package:body_fix2/body%20fix/presentation/loading/loading.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/services/general_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup.dart';
import 'widgets/custom_login_form.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (controller) {
                if (controller.getIsloading) {
                  return const Loading();
                }

                return Stack(
                  children: [
                    Container(
                      height: Get.height,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            AppColors.primary,
                            AppColors.blue,
                          ],
                        ),
                        image: DecorationImage(
                          image: AssetImage(AppImagePath.bg),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                          CustomLoginFormCard(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1.2,
                                width: Get.width * 0.25,
                                color: AppColors.white,
                              ),
                              const Text("      Login With      "),
                              Container(
                                height: 1.2,
                                width: Get.width * 0.25,
                                color: AppColors.white,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomSocialMediaCard(
                                onTap: () {
                                  GeneralServices.snackBar(
                                      title: "comming Soon",
                                      message: "Under Development");
                                },
                                path: AppImagePath.google,
                                title: "Google",
                              ),
                              CustomSocialMediaCard(
                                onTap: () {
                                  GeneralServices.snackBar(
                                      title: "comming Soon",
                                      message: "Under Development");
                                },
                                path: AppImagePath.facebook,
                                title: "FackeBook",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Don't have an account ?"),
                              InkWell(
                                  onTap: () {
                                    Get.delete<LoginController>();
                                    Get.off(() => SignUp());
                                  },
                                  child: const Text(
                                    " SignUp",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
