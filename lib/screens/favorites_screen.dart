import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/catalog_provider.dart';
import '../widgets/destination_card.dart';
import '../widgets/empty_state.dart';
import 'detail_screen.dart';

/// Pantalla 4: destinos marcados como favoritos.
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catalog = context.watch<CatalogProvider>();
    final items = catalog.favorites;

    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos')),
      body: items.isEmpty
          ? const EmptyState(
              icon: Icons.favorite_border,
              message: 'Aún no tienes favoritos.\nToca el corazón en un destino.')
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              itemBuilder: (context, i) {
                final d = items[i];
                return DestinationCard(
                  destination: d,
                  isFavorite: true,
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
