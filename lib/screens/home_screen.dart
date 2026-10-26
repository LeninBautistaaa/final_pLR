import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/icon_mapper.dart';
import '../providers/catalog_provider.dart';
import '../widgets/app_search_field.dart';
import '../widgets/category_chip.dart';
import '../widgets/destination_card.dart';
import '../widgets/empty_state.dart';
import 'categories_screen.dart';
import 'category_results_screen.dart';
import 'detail_screen.dart';
import 'favorites_screen.dart';

/// Pantalla 2: catálogo principal con búsqueda y filtros rápidos.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catalog = context.watch<CatalogProvider>();
    final items = catalog.filtered;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinos'),
        actions: [
          IconButton(
            tooltip: 'Categorías',
            icon: const Icon(Icons.category_outlined),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CategoriesScreen()),
            ),
          ),
          IconButton(
            tooltip: 'Favoritos',
            icon: Badge(
              isLabelVisible: catalog.favoritesCount > 0,
              label: Text('${catalog.favoritesCount}'),
              child: const Icon(Icons.favorite_border),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FavoritesScreen()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AppSearchField(onChanged: catalog.search),
            const SizedBox(height: 12),
            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final c in catalog.categories)
                    CategoryChip(
                      label: c.name,
                      icon: iconFromName(c.icon),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CategoryResultsScreen(category: c)),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: items.isEmpty
                  ? const EmptyState(
                      icon: Icons.search_off,
                      message: 'No se encontraron destinos.')
                  : ListView.builder(
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
            ),
          ],
        ),
      ),
    );
  }
}
