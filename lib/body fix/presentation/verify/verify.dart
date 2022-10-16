import 'package:body_fix2/body%20fix/controller/verify_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/core/utils/string.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Verify extends StatelessWidget {
  Verify({Key? key}) : super(key: key);
  VerifyController verifyController = Get.put(VerifyController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                AppImagePath.verify,
                width: Get.width * 0.6,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "${AppString.titleVerify}\n",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.black),
                  ),
                  TextSpan(
                    text: AppString.bodyVerify,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.darkGray),
                  )
                ]),
                textAlign: TextAlign.center,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<VerifyController>(builder: (controller) {
                    return Text(
                      "Timer: ${verifyController.getCounter} second",
                      style: const TextStyle(color: AppColors.black),
                    );
                  }),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  GetBuilder<VerifyController>(builder: (controller) {
                    return CustomElevatedButton(
                        onPressed: verifyController.getCounter != 0
                            ? null
                            : () {
                                verifyController.startTimer();
                                print("RESEND");
                              },
                        child: const Text(AppString.textButtonVerify));
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
