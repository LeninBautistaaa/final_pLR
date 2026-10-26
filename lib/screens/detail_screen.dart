import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/destination.dart';
import '../providers/catalog_provider.dart';
import '../widgets/activity_chip.dart';
import '../widgets/favorite_button.dart';
import '../widgets/info_row.dart';
import '../widgets/network_image_safe.dart';
import '../widgets/price_tag.dart';
import '../widgets/rating_badge.dart';
import '../widgets/section_title.dart';

/// Pantalla 3: detalle de un destino.
class DetailScreen extends StatelessWidget {
  final Destination destination;

  const DetailScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final catalog = context.watch<CatalogProvider>();
    final category = catalog.categoryOf(destination.categoryId);

    return Scaffold(
      appBar: AppBar(
        actions: [
          FavoriteButton(
            isFavorite: catalog.isFavorite(destination.id),
            onPressed: () => catalog.toggleFavorite(destination.id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageSafe(
              url: destination.imageUrl,
              height: 220,
              borderRadius: BorderRadius.circular(16),
            ),
            const SizedBox(height: 16),
            Text(destination.name,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                RatingBadge(rating: destination.rating),
                const SizedBox(width: 12),
                PriceTag(priceMxn: destination.priceMxn),
              ],
            ),
            const SectionTitle('Acerca del lugar'),
            Text(destination.description,
                style: Theme.of(context).textTheme.bodyMedium),
            const SectionTitle('Información'),
            InfoRow(
                icon: Icons.map_outlined,
                label: 'Región',
                value: destination.region),
            InfoRow(
                icon: Icons.category_outlined,
                label: 'Categoría',
                value: category?.name ?? '-'),
            InfoRow(
                icon: Icons.wb_sunny_outlined,
                label: 'Mejor época',
                value: destination.bestSeason),
            const SectionTitle('Actividades'),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final a in destination.activities) ActivityChip(label: a),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
