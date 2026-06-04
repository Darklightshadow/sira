import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  // Unité de base : 4px
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 28.0;
  static const double huge = 36.0;
  static const double massive = 48.0;

  // Padding horizontal des écrans (tiré des maquettes : 24-28px)
  static const double screenPaddingH = 24.0;
  static const double screenPaddingHWide = 28.0;

  // Padding vertical des écrans
  static const double screenPaddingV = 16.0;

  // Gaps entre éléments de liste
  static const double cardGap = 12.0;
  static const double sectionGap = 24.0;

  // Border radius
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 20.0;
  static const double radiusFull = 999.0;

  // Hauteurs fixes
  static const double buttonHeight = 56.0;
  static const double inputHeight = 56.0;
  static const double cardMinHeight = 68.0;
  static const double bottomNavHeight = 64.0;
  static const double appBarHeight = 56.0;
  static const double statusBarHeight = 48.0;

  // Helpers EdgeInsets
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: screenPaddingH,
    vertical: screenPaddingV,
  );

  static const EdgeInsets cardPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: xxl,
    vertical: lg,
  );
}
