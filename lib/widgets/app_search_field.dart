import 'package:flutter/material.dart';

import '../core/app_theme.dart';

class AppSearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hint;

  const AppSearchField({
    super.key,
    required this.onChanged,
    this.hint = 'Buscar destino o región',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
