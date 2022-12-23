import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomSocialMediaCard extends StatelessWidget {
  CustomSocialMediaCard(
      {required this.onTap, required this.path, required this.title, Key? key})
      : super(key: key);
  String path;
  String title;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomContainer(
        height: Get.height * 0.08,
        width: Get.width * 0.33,
        borderRadius: 5,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              path,
              width: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style:
                  TextStyle(fontSize: Get.width * 0.04, color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
