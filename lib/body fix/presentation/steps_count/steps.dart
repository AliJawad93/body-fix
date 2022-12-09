import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Steps extends StatefulWidget {
  const Steps({super.key});

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  TextEditingController goal = TextEditingController();
  int value = 50;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text("Steps Count"),
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Steps Goal ",
                  titleStyle: TextStyle(color: AppColors.primary),
                  radius: 10,
                  contentPadding: EdgeInsets.all(20),
                  confirm: CustomElevatedButton(
                      onPressed: () {
                        setState(() {});
                        Get.back();
                      },
                      child: Text("confirm")),
                  content: CustomTextForm(hintText: "Goal", controller: goal),
                );
              },
              icon: Icon(Icons.wifi_tethering))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: sqrt(Get.height + Get.width) * 0.4,
              vertical: sqrt(Get.height + Get.width)),
          alignment: Alignment.center,
          child: Column(
            children: [
              CircularPercentIndicator(
                animation: true,
                animationDuration: 500,
                radius: 100,
                lineWidth: 25,
                percent: value / int.parse(goal.text),
                progressColor: AppColors.primary,
                backgroundColor: AppColors.primaryLight,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "${(value / int.parse(goal.text) * 100)}%",
                  style: TextStyle(color: AppColors.black),
                ),
              ),
              SizedBox(
                height: Get.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Activities",
                      style: TextStyle(color: AppColors.black, fontSize: 25),
                    ),
                    CustomContainer(
                      borderRadius: 10,
                      padding:
                          EdgeInsets.all(sqrt(Get.height + Get.width) * 0.6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.wifi_tethering,
                            size: 40,
                            color: AppColors.primary,
                          ),
                          Text(
                            " ${goal.text} ( ${(value / int.parse(goal.text) * 100)} % )",
                            style: TextStyle(color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    CustomContainer(
                      borderRadius: 10,
                      padding:
                          EdgeInsets.all(sqrt(Get.height + Get.width) * 0.6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.local_fire_department_outlined,
                            size: 40,
                            color: AppColors.primary,
                          ),
                          Text(
                            " Burn Calories: 120",
                            style: TextStyle(color: AppColors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
