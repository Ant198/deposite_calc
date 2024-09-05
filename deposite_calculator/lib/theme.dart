import 'package:flutter/material.dart';

class AppColors {
  static Color primeColor = const Color.fromRGBO(20, 54, 1, 1);
  static Color secondaryColor = const Color.fromRGBO(26, 67, 1, 1);
  static Color titleColor = const Color.fromRGBO(36, 85, 1, 1);
  static Color successColor = const Color.fromRGBO(83, 141, 34, 1);
  static Color highlightColor = const Color.fromRGBO(115, 169, 66, 1);
  static Color textColor = const Color.fromRGBO(170, 213, 118, 1);
}

ThemeData primeTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primeColor,
  ),

  scaffoldBackgroundColor: AppColors.primeColor,

// app bar theme colors

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),

  // text theme

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColors.textColor.withOpacity(0.5),
      fontSize: 16,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 16,
      letterSpacing: 2,
    )
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondaryColor.withOpacity(0.5),
    border: InputBorder.none,
    labelStyle: TextStyle(color: AppColors.textColor),
    prefixIconColor: AppColors.textColor
  ),

  //DropdowmTheme

  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: TextStyle(color: AppColors.textColor),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.secondaryColor,
    surfaceTintColor: AppColors.secondaryColor,
  )
);
