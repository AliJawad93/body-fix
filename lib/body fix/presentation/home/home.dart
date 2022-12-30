import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/main_page_controller.dart';
import '../../core/utils/colors.dart';
import 'widgets/custom_bottom_navig_bar.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      init: MainPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: true,
          floatingActionButton: Visibility(
            visible: !(MediaQuery.of(context).viewInsets.bottom != 0),
            child: FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () {
                controller.setCurrentIndex(0);
              },
              child: Image.asset(
                AppImagePath.bmi,
                width: 40,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomNavigationBar(),
          body: controller.getPages(),
        );
      },
    );
  }
}
