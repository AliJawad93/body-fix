import 'package:body_fix2/body%20fix/presentation/exercises/user/exercises.dart';
import 'package:body_fix2/body%20fix/presentation/food/user/food.dart';
import 'package:body_fix2/body%20fix/presentation/profile/profile.dart';
import 'package:body_fix2/body%20fix/presentation/steps_count/steps.dart';
import 'package:body_fix2/body%20fix/presentation/steps_count/steps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/bmr/bmr/bmr.dart';

class MainPageController extends GetxController {
  int _currentIndex = 0;
  setCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }

  Widget getPages() {
    return Stack(
        children: [BMR(), Food(), Exercises(), Steps(), Profile()]
            .asMap()
            .map((index, screen) {
              return MapEntry(
                index,
                Offstage(
                  offstage: getCurrentIndex != index,
                  child: screen,
                ),
              );
            })
            .values
            .toList());
  }

  int get getCurrentIndex => _currentIndex;
}
