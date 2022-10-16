import 'dart:async';

import 'package:get/get.dart';

class VerifyController extends GetxController {
  late Timer _timer;
  late int _counter;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _counter = 60;
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, _callback);
  }

  void _callback(Timer timer) {
    if (_counter == 0) {
      timer.cancel();
    } else {
      _counter--;
    }
    update();
  }

  @override
  void dispose() {
    _timer.cancel();
    print("DISPOSE TIMER ");
    super.dispose();
  }

  int get getCounter => _counter;
}
