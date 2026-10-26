import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/icon_mapper.dart';
import '../providers/catalog_provider.dart';
import '../widgets/category_tile.dart';
import 'category_results_screen.dart';

/// Pantalla 5: lista de categorías.
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catalog = context.watch<CatalogProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Categorías')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: catalog.categories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final c = catalog.categories[i];
          return CategoryTile(
            name: c.name,
            description: c.description,
            icon: iconFromName(c.icon),
            count: catalog.byCategory(c.id).length,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CategoryResultsScreen(category: c)),
            ),
          );
        },
      ),
    );
  }
}
