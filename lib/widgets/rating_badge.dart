import 'package:flutter/material.dart';

import '../core/app_theme.dart';

class RatingBadge extends StatelessWidget {
  final double rating;

  const RatingBadge({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_rounded, size: 18, color: AppColors.accent),
        const SizedBox(width: 4),
        Text(rating.toStringAsFixed(1),
            style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
