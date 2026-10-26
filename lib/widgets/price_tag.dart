import 'package:flutter/material.dart';

import '../core/app_theme.dart';

class PriceTag extends StatelessWidget {
  final int priceMxn;

  const PriceTag({super.key, required this.priceMxn});

  @override
  Widget build(BuildContext context) {
    final text = priceMxn == 0 ? 'Entrada libre' : '\$$priceMxn MXN';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.primary),
      ),
    );
  }
}
