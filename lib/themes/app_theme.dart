import 'package:calculator_app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkBlueColor),
  );
}
