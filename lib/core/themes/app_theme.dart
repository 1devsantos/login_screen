import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData get mainTheme => ThemeData(
        useMaterial3: false,
        primaryColor: AppColors.primary,
        brightness: Brightness.light,
        textTheme: TextTheme(
            titleLarge: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodySmall: GoogleFonts.manrope(
              fontSize: 14,
              color: AppColors.secondary,
            ),
            labelMedium: GoogleFonts.manrope(
              fontSize: 16,
              color: AppColors.primary,
            ),
            bodyMedium: GoogleFonts.manrope(
              color: AppColors.tertiary,
              fontSize: 16,
            )),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      );
}
