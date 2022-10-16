import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  bool _visibility = false;

  void changeVisibility() {
    _visibility = !getVisibility;
    update();
  }

  bool checkPasswordEqualConfirmPassword() {
    if (_password.text == _confirmPassword.text) {
      return true;
    }

    return false;
  }

  TextEditingController get getEmail => _email;
  TextEditingController get getPassword => _password;
  TextEditingController get getConfirmPassword => _confirmPassword;
  bool get getVisibility => _visibility;
}
