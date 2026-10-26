import 'package:flutter/material.dart';

import '../core/app_theme.dart';

class ActivityChip extends StatelessWidget {
  final String label;

  const ActivityChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 12)),
      backgroundColor: AppColors.surface,
      side: BorderSide(color: AppColors.primary.withOpacity(0.3)),
      visualDensity: VisualDensity.compact,
    );
  }
}
