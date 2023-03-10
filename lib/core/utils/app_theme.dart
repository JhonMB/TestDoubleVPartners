import 'package:flutter/material.dart';

import 'package:flutter_test_project/core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: AppColors.primaryDark,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
      backgroundColor: AppColors.primaryDark,
    ),
  );
}
