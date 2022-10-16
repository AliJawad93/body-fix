import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
        appBarTheme: _appBarTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(),
        textTheme: _getTextTheme());
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      //systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: AppColors.primary,
      centerTitle: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
        ),
      ),
      titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  static _getTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 23,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white,
        fontSize: 17,
      ),
    );
  }

  static _inputDecorationTheme() {
    return const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      focusColor: AppColors.white,
      prefixIconColor: AppColors.darkGray,
      suffixIconColor: AppColors.darkGray,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkGray, width: 1.5),
        // borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: 1.5),
        //borderRadius: BorderRadius.circular(5),
      ),
      hintStyle: TextStyle(color: AppColors.darkGray),
    );
  }

  static _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // <-- Radius
      ),
    ));
  }
}
