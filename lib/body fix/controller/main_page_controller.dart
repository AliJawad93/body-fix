import 'package:body_fix2/body%20fix/presentation/food/f1.dart';
import 'package:body_fix2/body%20fix/presentation/food/f2.dart';
import 'package:body_fix2/body%20fix/presentation/food/f3.dart';
import 'package:body_fix2/body%20fix/presentation/food/food.dart';
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
        children: [BMR(), Food1(), Food2(), Food3(), Food()]
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
