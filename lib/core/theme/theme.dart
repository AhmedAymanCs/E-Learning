import 'package:e_learning/core/constant/color_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: ColorManager.scafoldBackgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: ColorManager.white),
  );
}
