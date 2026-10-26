import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../models/destination.dart';
import 'favorite_button.dart';
import 'network_image_safe.dart';
import 'price_tag.dart';
import 'rating_badge.dart';

/// Tarjeta reutilizable de un destino (usada en 3 pantallas).
class DestinationCard extends StatelessWidget {
  final Destination destination;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageSafe(url: destination.imageUrl, height: 160),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(destination.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 2),
                        Text(destination.region,
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            RatingBadge(rating: destination.rating),
                            const SizedBox(width: 12),
                            Flexible(
                                child: PriceTag(priceMxn: destination.priceMxn)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FavoriteButton(
                      isFavorite: isFavorite, onPressed: onFavoriteTap),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
