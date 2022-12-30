import 'package:body_fix2/body%20fix/controller/set_info_profile_controller.dart';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/string.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/loading/loading.dart';
import 'package:body_fix2/body%20fix/presentation/set_info_profile/widgets/custom_form_setInfoprofile.dart';
import 'package:body_fix2/body%20fix/presentation/set_info_profile/widgets/custom_image_piker.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetInfoProfile extends StatelessWidget {
  SetInfoProfile({Key? key}) : super(key: key);
  SetInfoProfileController setInfoProfileController =
      Get.put(SetInfoProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<SetInfoProfileController>(
            init: SetInfoProfileController(),
            builder: (controller) {
              if (controller.getIsloading) {
                return const Loading();
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImagePikker(),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  CustomFormSetInfoProfile(),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                ],
              );
            },
          )),
    );
  }
}
