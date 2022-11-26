import 'package:body_fix2/body%20fix/core/utils/theme/light_theme.dart';
import 'package:body_fix2/body%20fix/presentation/exercises/admin/add_exercises.dart';
import 'package:body_fix2/body%20fix/presentation/food/admin/add_food.dart';
import 'package:body_fix2/body%20fix/presentation/home/home.dart';
import 'package:body_fix2/body%20fix/presentation/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.getLightTheme(),
      home: OnBoarding(),
    );
  }
}
