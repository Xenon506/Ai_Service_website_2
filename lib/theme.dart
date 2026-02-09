import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color darkBg = Color(0xFF0F172A);
  static const Color darkBgSecondary = Color(0xFF111827);
  static const Color darkBgTertiary = Color(0xFF1F2937);
  static const Color orange = Color(0xFFF97316);
  static const Color orangeLight = Color(0xFFFB923C);
  static const Color orangeDark = Color(0xFFEA580C);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFD1D5DB);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color borderColor = Color(0xFF374151);
  static const Color borderColorLight = Color(0xFF4B5563);
}

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBg,
      primaryColor: AppColors.orange,
      colorScheme: ColorScheme.dark(
        primary: AppColors.orange,
        secondary: AppColors.orangeLight,
        surface: AppColors.darkBgSecondary,
        error: Colors.red,
      ),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ).copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 56,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 44,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textTertiary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkBgTertiary,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.orange, width: 2),
        ),
        hintStyle: GoogleFonts.inter(
          color: AppColors.textTertiary,
          fontSize: 14,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
