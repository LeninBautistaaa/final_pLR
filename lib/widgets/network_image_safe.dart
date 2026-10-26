import 'package:flutter/material.dart';

import '../core/app_theme.dart';

/// Imagen remota con indicador de carga y respaldo si falla la red.
class NetworkImageSafe extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BorderRadius borderRadius;

  const NetworkImageSafe({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        url,
        height: height,
        width: width ?? double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return SizedBox(
            height: height,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stack) => Container(
          height: height,
          width: width ?? double.infinity,
          color: AppColors.primary.withOpacity(0.12),
          child: const Icon(Icons.image_not_supported_outlined,
              color: AppColors.textMuted),
        ),
      ),
    );
  }
}
