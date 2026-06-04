import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  bool get isValidPhone {
    return RegExp(r'^\+?[0-9]{8,15}$').hasMatch(trim());
  }
}

extension ContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColors.danger : AppColors.textPrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

extension NiveauStockColorExtension on String {
  Color get stockColor {
    switch (this) {
      case 'ok':
        return AppColors.stockOk;
      case 'faible':
        return AppColors.stockFaible;
      default:
        return AppColors.stockRupture;
    }
  }
}
