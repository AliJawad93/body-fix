import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold(
      {this.resizeToAvoidBottomInset = true,
      this.appBar,
      this.body,
      super.key});
  Widget? body;
  PreferredSizeWidget? appBar;
  bool resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
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
            child: Align(alignment: Alignment.topLeft, child: body),
          )
        ],
      ),
    );
  }
}
