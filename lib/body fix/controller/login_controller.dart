import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  bool _visibility = false;

  void changeVisibility() {
    _visibility = !getVisibility;
    update();
  }

  TextEditingController get getEmail => _email;
  TextEditingController get getPassword => _password;
  bool get getVisibility => _visibility;
}
