import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controller/main_page_controller.dart';
import '../../../core/utils/colors.dart';

class CustomIconBottomBar extends StatelessWidget {
  final int indexPage;
  final IconData iconData;
  final double size;
  const CustomIconBottomBar({
    Key? key,
    required this.indexPage,
    required this.iconData,
    required this.size,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) {
        return IconButton(
          onPressed: () {
            controller.setCurrentIndex(indexPage);
          },
          icon: Icon(
            iconData,
            size: size,
            color: controller.getCurrentIndex != indexPage
                ? AppColors.darkGray
                : AppColors.primary,
          ),
        );
      },
    );
  }
}
