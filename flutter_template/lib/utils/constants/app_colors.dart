import 'package:flutter/material.dart';

class AppColors {
  // App Basic Colors
  static const Color primary = Colors.blue;
  static Color secondary = Colors.blue.shade300;
  static const Color accent = Color(0xffE0FFE5);
  // static const Color primaryYellow = Color(0xffFFDD65);
  // static const Color secondaryYellow = Color(0xffFFE9AF);
  // static const Color accentYellow = Color(0xffE0FFE5);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFFFF6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFFFF6F6);
  static Color darkContainer = AppColors.white.withOpacity(0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0x0ff6757d);
  static const Color buttonDisabled = Color(0x0ff4c4c4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFFFC700);
  static const Color info = Color(0xFF1976D2);

  // Gradient Colors
  static const Gradient gradientColor = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xff1BB040),
      Color(0xff66CA7F),
      Color(0xffE0FFE5),
    ],
  );

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
