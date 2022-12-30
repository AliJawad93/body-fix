import 'package:body_fix2/body%20fix/core/utils/theme/light_theme.dart';
import 'package:body_fix2/body%20fix/presentation/auth/login.dart';
import 'package:body_fix2/body%20fix/presentation/auth/signup.dart';
import 'package:body_fix2/body%20fix/presentation/home/home.dart';
import 'package:body_fix2/body%20fix/presentation/loading/loading.dart';
import 'package:body_fix2/body%20fix/presentation/onboarding/onboarding.dart';
import 'package:body_fix2/body%20fix/services/shareprefs_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.getLightTheme(),
      home: prefs.getBool(SharePrefsKeys.onboarding) == false
          ? (prefs.getBool(SharePrefsKeys.isLogedin) == true ? Home() : Login())
          : OnBoarding(),
    );
  }
}
