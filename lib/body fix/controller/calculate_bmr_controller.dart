import 'package:body_fix2/body%20fix/core/utils/string.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculateBMRController extends GetxController {
  double _heigth = 100;
  int _width = 50;
  int _age = 10;
  bool? _isMale = true;
  SharedPreferences? prefs;
  String _calories = "0.0";
  String _fat = "0.0";
  String _carbs = "0.0";
  String _protein = "0.0";
  @override
  onInit() {
    super.onInit();
    onInitPrefs();
  }

  onInitPrefs() async {
    prefs = await SharedPreferences.getInstance();
    _calories = getPrefsDouble(AppString.titleCalories).toString();
    _fat = getPrefsDouble(AppString.titleFat).toString();
    _carbs = getPrefsDouble(AppString.titleCarbs).toString();
    _protein = getPrefsDouble(AppString.titleProtein).toString();
    update();
  }

  Future<void> setPrefsDouble(String key, double value) async {
    value = double.parse(value.toStringAsFixed(2));
    await prefs?.setDouble(key, value);
  }

  void setIsMale(bool isMale) {
    _isMale = isMale;
    update();
  }

  void setHeigth(double value) {
    _heigth = value;
    update();
  }

  void incrementWidth() {
    _width++;
    update();
  }

  void decrementWidth() {
    _width--;
    update();
  }

  void incrementAge() {
    _age++;
    update();
  }

  void decrementAge() {
    _age--;
    update();
  }

  double get getHeight => _heigth;
  int get getWidth => _width;
  int get getAge => _age;
  bool? get getIsMale => _isMale;

  String get getCalories => _calories;
  String get getFat => _fat;
  String get getCarbs => _carbs;
  String get getProtein => _protein;

  double getPrefsDouble(String key) {
    return prefs?.getDouble(key) ?? 0.0;
  }
}
