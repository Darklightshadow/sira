import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  // Police de base — Nunito (tirée des maquettes)
  static TextStyle get _base => GoogleFonts.nunito();

  // Display — Titres principaux (splash, onboarding)
  static TextStyle get displayLarge => _base.copyWith(
        fontSize: 46,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.14 * 46,
        color: AppColors.primary,
      );

  // Headings
  static TextStyle get h1 => _base.copyWith(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get h2 => _base.copyWith(
        fontSize: 25,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.28,
      );

  static TextStyle get h3 => _base.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get h4 => _base.copyWith(
        fontSize: 19,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      );

  // Corps de texte
  static TextStyle get bodyLarge => _base.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyMedium => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.6,
      );

  static TextStyle get bodySmall => _base.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  // Labels et boutons
  static TextStyle get labelLarge => _base.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: AppColors.textOnPrimary,
      );

  static TextStyle get labelMedium => _base.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.textSecondary,
      );

  static TextStyle get labelSmall => _base.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
        letterSpacing: 0.03 * 13,
      );

  // Navigation bottom bar
  static TextStyle get navLabel => _base.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.textTertiary,
      );

  static TextStyle get navLabelActive => _base.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      );

  // Badge et caption
  static TextStyle get caption => _base.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: AppColors.textTertiary,
      );

  // Nom de l'app dans la barre
  static TextStyle get appName => _base.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w800,
        color: AppColors.primary,
        letterSpacing: 0.08 * 17,
      );
}
