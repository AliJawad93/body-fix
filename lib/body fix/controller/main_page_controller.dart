import 'package:body_fix2/body%20fix/data/auth.dart';
import 'package:body_fix2/body%20fix/data/user_info.dart';
import 'package:body_fix2/body%20fix/models/user_model.dart';
import 'package:body_fix2/body%20fix/presentation/exercises/user/exercises.dart';
import 'package:body_fix2/body%20fix/presentation/food/user/food.dart';
import 'package:body_fix2/body%20fix/presentation/profile/profile.dart';
import 'package:body_fix2/body%20fix/presentation/steps_count/steps.dart';
import 'package:body_fix2/body%20fix/services/shareprefs_keys.dart';
import 'package:body_fix2/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/bmr/bmr/bmr.dart';

class MainPageController extends GetxController {
  int _currentIndex = 0;

  @override
  onInit() {
    super.onInit();
    getUserInfo();
  }

  getUserInfo() async {
    if (prefs.getBool(SharePrefsKeys.isLogedin) == null ||
        prefs.getBool(SharePrefsKeys.isLogedin) == false) {
      UserModel userModel = await FirebaseUserInfo.getDataUser(
          FirebaseAuthentication.getInfoAuthUser.uid);
      await prefs.setString(SharePrefsKeys.id, userModel.id);
      await prefs.setString(SharePrefsKeys.name, userModel.name);
      await prefs.setString(SharePrefsKeys.email, userModel.email);
      await prefs.setString(SharePrefsKeys.birthDay, userModel.birthDay);
      await prefs.setString(SharePrefsKeys.urlImage, userModel.urlImage ?? "");
      await prefs.setInt(SharePrefsKeys.userRole, userModel.userRole);
      await prefs.setBool(SharePrefsKeys.isLogedin, true);
    }
  }

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
