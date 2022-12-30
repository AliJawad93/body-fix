import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isloading = false;
  bool _visibility = false;

  void changeVisibility() {
    _visibility = !getVisibility;
    update();
  }

  void changeIsloading(bool status) {
    _isloading = status;
    update();
  }

  TextEditingController get getEmail => _email;
  TextEditingController get getPassword => _password;
  bool get getVisibility => _visibility;
  bool get getIsloading => _isloading;
}
