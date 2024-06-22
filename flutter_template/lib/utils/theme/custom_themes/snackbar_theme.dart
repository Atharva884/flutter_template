import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constants/app_colors.dart';

class TSnackbarTheme {
  // Light Theme
  static const lightSnackbarTheme = SnackBarThemeData(
    backgroundColor: Colors.black,
    contentTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    actionTextColor: AppColors.primary,
    disabledActionTextColor: Colors.grey,
    elevation: 0,
  );

  // Dark Theme
  static const darkSnackbarTheme = SnackBarThemeData(
    backgroundColor: Colors.white,
    contentTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    actionTextColor: AppColors.primary,
    disabledActionTextColor: Colors.grey,
    elevation: 0,
  );
}
