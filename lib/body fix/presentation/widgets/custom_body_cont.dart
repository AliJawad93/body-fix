import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({this.appBar, this.body, super.key});
  Widget? body;
  PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: Get.height,
              width: Get.width,
              color: AppColors.primary,
            ),
          ),
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60.0),
              ),
            ),
            child: body,
          )
        ],
      ),
    );
  }
}
