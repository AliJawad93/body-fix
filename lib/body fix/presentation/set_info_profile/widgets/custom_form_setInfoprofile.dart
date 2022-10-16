import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/set_info_profile_controller.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/string.dart';
import '../../auth/widgets/custom_text_form.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_elevated_button.dart';

class CustomFormSetInfoProfile extends StatelessWidget {
  CustomFormSetInfoProfile({Key? key}) : super(key: key);
  SetInfoProfileController setInfoProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: Get.height * 0.40,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextForm(
              hintText: AppString.hintTextFormName,
              controller: setInfoProfileController.getNameController,
              prefixIcon: const Icon(Icons.person)),
          CustomContainer(
            height: Get.height * 0.08,
            padding: const EdgeInsets.all(10),
            borderRadius: 5,
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: AppColors.darkGray,
                ),
                GetBuilder<SetInfoProfileController>(builder: (context) {
                  return Text(
                    setInfoProfileController.getBirthday == null
                        ? AppString.hintTextFormBirthday
                        : setInfoProfileController.getBirthday!,
                    style: const TextStyle(color: AppColors.darkGray),
                  );
                }),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setInfoProfileController.showCalender(context);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.primary,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          CustomElevatedButton(
              onPressed: () {},
              child: const Text(AppString.textButtonSetInfoProfile))
        ],
      ),
    );
  }
}
