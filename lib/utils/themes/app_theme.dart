import 'package:flutter/material.dart';
import 'package:saropa_task/ui/common/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.blackColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColors.primaryColor,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.normal,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.blackColor),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.blackColor),
      bodySmall: TextStyle(color: AppColors.blackColor),
      displayLarge:
          TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: AppColors.blackColor),
      displaySmall: TextStyle(color: AppColors.blackColor),
      titleLarge: TextStyle(color: AppColors.blackColor),
      titleMedium: TextStyle(color: AppColors.blackColor),
      titleSmall: TextStyle(color: AppColors.blackColor),
      labelLarge: TextStyle(color: AppColors.blackColor),
      labelMedium: TextStyle(color: AppColors.blackColor),
      labelSmall: TextStyle(color: AppColors.blackColor),
      headlineLarge: TextStyle(color: AppColors.blackColor),
      headlineMedium: TextStyle(color: AppColors.blackColor),
      headlineSmall: TextStyle(color: AppColors.blackColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.whiteColor,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: AppColors.primaryColorLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.blackColor,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.primaryColor,
      inactiveTrackColor: AppColors.primaryColor.withAlpha(75),
      thumbColor: AppColors.primaryColorLight,
      overlayColor: AppColors.primaryColor.withAlpha(32),
      valueIndicatorColor: AppColors.primaryColorLight,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.blackColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColors.primaryColor,
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.normal,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.whiteColor),
      bodyMedium: TextStyle(color: AppColors.whiteColor),
      bodySmall: TextStyle(color: AppColors.whiteColor),
      displayLarge:
          TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: AppColors.whiteColor),
      displaySmall: TextStyle(color: AppColors.whiteColor),
      titleLarge: TextStyle(color: AppColors.whiteColor),
      titleMedium: TextStyle(color: AppColors.whiteColor),
      titleSmall: TextStyle(color: AppColors.whiteColor),
      labelLarge: TextStyle(color: AppColors.whiteColor),
      labelMedium: TextStyle(color: AppColors.whiteColor),
      labelSmall: TextStyle(color: AppColors.whiteColor),
      headlineLarge: TextStyle(color: AppColors.whiteColor),
      headlineMedium: TextStyle(color: AppColors.whiteColor),
      headlineSmall: TextStyle(color: AppColors.whiteColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyColor,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: AppColors.primaryColorLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.blackColor,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.primaryColor,
      inactiveTrackColor: AppColors.primaryColor.withAlpha(75),
      thumbColor: AppColors.primaryColorLight,
      overlayColor: AppColors.primaryColor.withAlpha(32),
      valueIndicatorColor: AppColors.primaryColorLight,
    ),
  );
}
