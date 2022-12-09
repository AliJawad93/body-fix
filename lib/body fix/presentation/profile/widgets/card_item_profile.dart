import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/colors.dart';
import '../../widgets/custom_container.dart';

class CardItemProfile extends StatelessWidget {
  String title;
  IconData iconData;
  void Function() onTap;
  CardItemProfile({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomContainer(
        padding: EdgeInsets.all(sqrt(Get.height + Get.width) * 0.8),
        borderRadius: 10,
        child: Row(
          children: [
            Icon(
              iconData,
              color: AppColors.primary,
            ),
            SizedBox(
              width: Get.width * 0.05,
            ),
            Text(
              title,
              style: const TextStyle(color: AppColors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
