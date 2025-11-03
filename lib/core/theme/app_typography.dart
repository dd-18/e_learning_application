import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTypography {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      color: AppColors.lightText,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    displayMedium: GoogleFonts.poppins(
      color: AppColors.lightText,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    displaySmall: GoogleFonts.poppins(
      color: AppColors.lightText,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
    headlineMedium: GoogleFonts.poppins(
      color: AppColors.lightText,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    titleLarge: GoogleFonts.poppins(
      color: AppColors.lightText,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    bodyLarge: GoogleFonts.poppins(color: AppColors.lightText, fontSize: 16),
    bodyMedium: GoogleFonts.poppins(color: AppColors.lightText, fontSize: 14),
    labelLarge: GoogleFonts.poppins(
      color: AppColors.lightText,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  );
}
