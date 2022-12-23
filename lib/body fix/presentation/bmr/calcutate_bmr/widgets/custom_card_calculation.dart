import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/colors.dart';
import '../../../widgets/custom_container.dart';

class CustomCardCalaulation extends StatelessWidget {
  String title;
  String subTitle;
  void Function()? onPressedRemove;
  void Function()? onPressedAdd;
  CustomCardCalaulation({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onPressedRemove,
    required this.onPressedAdd,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: sqrt(Get.width + Get.height) * 4,
      width: sqrt(Get.width + Get.height) * 4,
      borderRadius: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColors.black, fontSize: 25),
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.black, fontWeight: FontWeight.normal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primary,
                child: IconButton(
                    color: Colors.white,
                    onPressed: onPressedRemove,
                    icon: const Icon(Icons.remove)),
              ),
              CircleAvatar(
                backgroundColor: AppColors.primary,
                child: IconButton(
                    color: Colors.white,
                    onPressed: onPressedAdd,
                    icon: const Icon(Icons.add)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
