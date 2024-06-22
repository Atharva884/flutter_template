import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constants/app_colors.dart';
import 'package:flutter_template/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:flutter_template/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flutter_template/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:flutter_template/utils/theme/custom_themes/chip_theme.dart';
import 'package:flutter_template/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:flutter_template/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:flutter_template/utils/theme/custom_themes/snackbar_theme.dart';
import 'package:flutter_template/utils/theme/custom_themes/text_form_field_theme.dart';
import 'package:flutter_template/utils/theme/custom_themes/text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    dialogBackgroundColor: AppColors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TEleveatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    chipTheme: TChipTheme.lightChipTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    snackBarTheme: TSnackbarTheme.lightSnackbarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,
    dialogBackgroundColor: AppColors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TEleveatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    chipTheme: TChipTheme.darkChipTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    snackBarTheme: TSnackbarTheme.darkSnackbarTheme,
  );
}
