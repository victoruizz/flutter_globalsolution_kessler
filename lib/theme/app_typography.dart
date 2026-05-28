import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTypography {
  const AppTypography._();

  static TextStyle displayLarge() => GoogleFonts.orbitron(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        letterSpacing: 4,
        color: AppColors.textPrimary,
      );

  static TextStyle displayMedium() => GoogleFonts.orbitron(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: 2,
        color: AppColors.textPrimary,
      );

  static TextStyle headlineSmall() => GoogleFonts.orbitron(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        color: AppColors.textPrimary,
      );

  static TextStyle titleLarge() => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle titleMedium() => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle bodyLarge() => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.textPrimary,
      );

  static TextStyle bodyMedium() => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.textPrimary,
      );

  static TextStyle labelLarge() => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        color: AppColors.textPrimary,
      );

  static TextStyle labelSmall() => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 2,
        color: AppColors.textPrimary,
      );
}
