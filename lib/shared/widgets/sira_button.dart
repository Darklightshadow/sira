import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

enum SiraButtonVariant { primary, outline, ghost }

class SiraButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final SiraButtonVariant variant;
  final bool fullWidth;
  final bool isLoading;
  final Widget? prefixIcon;
  final double? height;

  const SiraButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = SiraButtonVariant.primary,
    this.fullWidth = true,
    this.isLoading = false,
    this.prefixIcon,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final h = height ?? AppSpacing.buttonHeight;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: h,
      child: switch (variant) {
        SiraButtonVariant.primary => _buildPrimary(),
        SiraButtonVariant.outline => _buildOutline(),
        SiraButtonVariant.ghost => _buildGhost(),
      },
    );
  }

  Widget _buildPrimary() {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
      ),
      child: _buildContent(AppColors.textOnPrimary),
    );
  }

  Widget _buildOutline() {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.border, width: 1.5),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
      ),
      child: _buildContent(AppColors.textPrimary),
    );
  }

  Widget _buildGhost() {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textSecondary,
      ),
      child: _buildContent(AppColors.textSecondary),
    );
  }

  Widget _buildContent(Color color) {
    if (isLoading) {
      return SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: color,
        ),
      );
    }
    if (prefixIcon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixIcon!,
          const SizedBox(width: AppSpacing.sm),
          Text(label, style: AppTypography.labelLarge.copyWith(color: color)),
        ],
      );
    }
    return Text(label, style: AppTypography.labelLarge.copyWith(color: color));
  }
}
