import 'package:flutter/material.dart';
import 'package:astha_engineering/core/constants/dimensions.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(fontSize: Dimensions.fontOverLarge, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
    displayMedium: TextStyle(fontSize: Dimensions.fontExtraLarge, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
    bodyLarge: TextStyle(fontSize: Dimensions.fontLarge, fontWeight: FontWeight.normal, color: AppColors.textPrimaryLight),
    bodyMedium: TextStyle(fontSize: Dimensions.fontDefault, fontWeight: FontWeight.normal, color: AppColors.textPrimaryLight),
    bodySmall: TextStyle(fontSize: Dimensions.fontSmall, fontWeight: FontWeight.normal, color: AppColors.textSecondaryLight),
    labelLarge: TextStyle(fontSize: Dimensions.fontDefault, fontWeight: FontWeight.w600, color: AppColors.surfaceLight),
  );

  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(fontSize: Dimensions.fontOverLarge, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
    displayMedium: TextStyle(fontSize: Dimensions.fontExtraLarge, fontWeight: FontWeight.bold, color: AppColors.textPrimaryDark),
    bodyLarge: TextStyle(fontSize: Dimensions.fontLarge, fontWeight: FontWeight.normal, color: AppColors.textPrimaryDark),
    bodyMedium: TextStyle(fontSize: Dimensions.fontDefault, fontWeight: FontWeight.normal, color: AppColors.textPrimaryDark),
    bodySmall: TextStyle(fontSize: Dimensions.fontSmall, fontWeight: FontWeight.normal, color: AppColors.textSecondaryDark),
    labelLarge: TextStyle(fontSize: Dimensions.fontDefault, fontWeight: FontWeight.w600, color: AppColors.surfaceDark),
  );
}
