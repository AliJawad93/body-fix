import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/presentation/auth/login.dart';
import 'package:body_fix2/body%20fix/presentation/home/home.dart';
import 'package:body_fix2/body%20fix/presentation/verify/verify.dart';
import 'package:body_fix2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../services/shareprefs_keys.dart';

class FirebaseAuthentication {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> login(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signUp(
      {required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<bool> getIsEmailVerify() async {
    await _auth.currentUser!.reload();
    return _auth.currentUser!.emailVerified;
  }

  static Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<bool> confirmLogin(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return true;
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: AppColors.white);
      return false;
    }
  }

  static Future<void> updateEmail({required String newEmail}) async {
    try {
      await _auth.currentUser?.updateEmail(newEmail);
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: AppColors.white);
    }
  }

  static Future<void> updatePassword({required String newPassword}) async {
    try {
      await _auth.currentUser?.updatePassword(newPassword);
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: AppColors.white);
    }
  }

  static Future<void> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: AppColors.white);
    }
  }

  static User get getInfoAuthUser => _auth.currentUser!;
}
