import 'dart:async';

import 'package:body_fix2/body%20fix/data/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  late Timer _timer;
  late Timer _timerVerify;
  late int _counter;
  late bool _isEmailVerify = false;

  @override
  void onInit() {
    startTimer();
    emailVerify();
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

  Future<void> emailVerify() async {
    _isEmailVerify = await FirebaseAuthentication.getIsEmailVerify();
    if (!_isEmailVerify) {
      resendEmailVerification();
      _timerVerify = Timer.periodic(const Duration(seconds: 3), (_) {
        checkEmailVerify();
      });
    }
  }

  Future<void> checkEmailVerify() async {
    _isEmailVerify = await FirebaseAuthentication.getIsEmailVerify();
    if (_isEmailVerify) _timerVerify.cancel();
    update();
  }

  Future<void> resendEmailVerification() async {
    await FirebaseAuthentication.sendEmailVerification();
  }

  @override
  void dispose() {
    _timer.cancel();
    print("DISPOSE TIMER ");
    super.dispose();
  }

  int get getCounter => _counter;
  bool get getEmailVerified => _isEmailVerify;
}
