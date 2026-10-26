import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../providers/catalog_provider.dart';
import '../widgets/destination_card.dart';
import '../widgets/empty_state.dart';
import 'detail_screen.dart';

/// Pantalla 6: destinos de una categoría.
class CategoryResultsScreen extends StatelessWidget {
  final Category category;

  const CategoryResultsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final catalog = context.watch<CatalogProvider>();
    final items = catalog.byCategory(category.id);

    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: items.isEmpty
          ? const EmptyState(
              icon: Icons.inbox_outlined,
              message: 'No hay destinos en esta categoría.')
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              itemBuilder: (context, i) {
                final d = items[i];
                return DestinationCard(
                  destination: d,
                  isFavorite: catalog.isFavorite(d.id),
                  onFavoriteTap: () => catalog.toggleFavorite(d.id),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailScreen(destination: d)),
                  ),
                );
              },
            ),
    );
  }
}
