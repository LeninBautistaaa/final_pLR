import 'package:flutter/material.dart';

import '../core/app_theme.dart';

/// Chip de filtro rápido para la pantalla principal.
class CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ActionChip(
        avatar: Icon(icon, size: 18, color: AppColors.primary),
        label: Text(label),
        backgroundColor: AppColors.surface,
        side: BorderSide(color: AppColors.primary.withOpacity(0.3)),
        onPressed: onTap,
      ),
    );
  }
}
