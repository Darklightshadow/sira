import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_spacing.dart';

class LanguageSwitcher extends StatelessWidget {
  final String langueActuelle;
  final void Function(String) onChanged;

  const LanguageSwitcher({
    super.key,
    required this.langueActuelle,
    required this.onChanged,
  });

  static const List<Map<String, String>> _langues = [
    {'code': 'fr', 'label': 'FR'},
    {'code': 'moore', 'label': 'MO'},
    {'code': 'dioula', 'label': 'DI'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: DropdownButton<String>(
        value: langueActuelle,
        underline: const SizedBox.shrink(),
        isDense: true,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 16,
          color: AppColors.primary,
        ),
        style: AppTypography.caption.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.04,
        ),
        dropdownColor: AppColors.surface,
        items: _langues
            .map(
              (l) => DropdownMenuItem<String>(
                value: l['code'],
                child: Text(l['label']!),
              ),
            )
            .toList(),
        onChanged: (val) {
          if (val != null) onChanged(val);
        },
      ),
    );
  }
}
