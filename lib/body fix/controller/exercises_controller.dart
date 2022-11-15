import 'package:get/get.dart';

class ExercisesController extends GetxController {
  int _selectedIndex = 0;

  setSelectedIndex(int index) {
    _selectedIndex = index;
    update();
  }

  int get getSelectedIndex => _selectedIndex;
}
