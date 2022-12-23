import 'dart:async';
import 'dart:math';
import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Steps extends StatefulWidget {
  Steps({super.key});

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  TextEditingController goal = TextEditingController();
  int value = 50;
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  int _steps = 1;
  bool isPermissioned = true;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps;
    });
  }

  void initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount);
    } else {
      setState(() {
        isPermissioned = false;
      });
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    goal.text = goal.text.isEmpty ? "100" : goal.text;
    return CustomScaffold(
      appBar: AppBar(
        title: const Text("Steps Count"),
        actions: [
          isPermissioned == false
              ? SizedBox()
              : IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Steps Goal ",
                      titleStyle: const TextStyle(color: AppColors.primary),
                      radius: 10,
                      contentPadding: const EdgeInsets.all(20),
                      confirm: CustomElevatedButton(
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString("goal", goal.text);
                            setState(() {});
                            Get.back();
                          },
                          child: const Text("confirm")),
                      content:
                          CustomTextForm(hintText: "Goal", controller: goal),
                    );
                  },
                  icon: const Icon(Icons.wifi_tethering))
        ],
      ),
      body: isPermissioned == false
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AppImagePath.manSad, width: Get.width * 0.3),
                  Text(
                    "No permission for steps count",
                    style: TextStyle(color: AppColors.black),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
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
                        percent: _steps > int.parse(goal.text)
                            ? int.parse(goal.text) * 0.01
                            : (_steps / int.parse(goal.text)),
                        progressColor: AppColors.primary,
                        backgroundColor: AppColors.primaryLight,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.directions_run,
                              size: 40,
                              color: AppColors.black,
                            ),
                            Text(
                              "${((_steps / int.parse(goal.text)) * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(color: AppColors.black),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: Get.height * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Activities",
                            style:
                                TextStyle(color: AppColors.black, fontSize: 25),
                          ),
                          CustomContainer(
                            borderRadius: 10,
                            padding: EdgeInsets.all(
                                sqrt(Get.height + Get.width) * 0.6),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.wifi_tethering,
                                  size: 40,
                                  color: AppColors.primary,
                                ),
                                Text(
                                  " ${goal.text} ( ${((_steps / int.parse(goal.text)) * 100).toStringAsFixed(0)} % )",
                                  style:
                                      const TextStyle(color: AppColors.black),
                                ),
                              ],
                            ),
                          ),
                          CustomContainer(
                            borderRadius: 10,
                            padding: EdgeInsets.all(
                                sqrt(Get.height + Get.width) * 0.6),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_fire_department_outlined,
                                  size: 40,
                                  color: AppColors.primary,
                                ),
                                Text(
                                  " Burn Calories: ${_steps * 0.04}",
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
