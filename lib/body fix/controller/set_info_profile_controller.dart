import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/piker_image.dart';

class SetInfoProfileController extends GetxController {
  TextEditingController _name = TextEditingController();
  String? _birthday;
  PlatformFile? _platformFile;
  bool _isloading = false;

  void changeIsloading(bool status) {
    _isloading = status;
    update();
  }

  void _setBirthday(String birthday) {
    _birthday = birthday;
    update();
  }

  Future<void> selectImage() async {
    _platformFile = await PickerImageService.selectImage();
    update();
  }

  showCalender(context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1970),
            lastDate: DateTime(2040))
        .then((value) {
      String birthday = "    ${value!.year}-${value.month}-${value.day}";
      _setBirthday(birthday);
    });
  }

  PlatformFile? get getPlatformFile => _platformFile;
  String? get getBirthday => _birthday;
  TextEditingController get getNameController => _name;
  bool get getIsloading => _isloading;
}
