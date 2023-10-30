// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:test_ordering/config/theme/colors.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.lightBackGround,
  primaryColor: AppColors.black,
  cardColor: AppColors.white,
  dividerColor: AppColors.gray5,
  dialogBackgroundColor: AppColors.white2,

  /// AppBar
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    color: AppColors.lightBackGround,
    surfaceTintColor: Colors.transparent,
    shape: Border(
      bottom: BorderSide(color: AppColors.gray5, width: 0.5),
    ),
    elevation: 0,
  ),

  /// Text
  textTheme: const TextTheme(
    //Headline
    headlineLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
    //Label
    labelMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    //Body
    bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
  ),

  /// InputDecoration
  inputDecorationTheme: InputDecorationTheme(
    isCollapsed: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
    filled: true,
    fillColor: AppColors.white,
    errorStyle: const TextStyle(
      color: AppColors.error,
      fontSize: 0.0,
      fontWeight: FontWeight.w700,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.gray3),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.gray3),
      borderRadius: BorderRadius.circular(8.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.error, width: 2),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.error),
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);
