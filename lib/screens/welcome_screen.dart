import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_theme.dart';
import '../providers/catalog_provider.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/stat_tile.dart';
import 'home_screen.dart';

/// Pantalla 1: bienvenida con resumen del catálogo.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catalog = context.watch<CatalogProvider>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.landscape_outlined,
                  size: 64, color: AppColors.primary),
              const SizedBox(height: 16),
              Text('Descubre Oaxaca',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                'Catálogo de destinos, cultura, playas y sabores del estado.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              if (catalog.status == LoadStatus.loading)
                const Center(child: CircularProgressIndicator())
              else if (catalog.status == LoadStatus.error)
                Text('Error al cargar datos: ${catalog.errorMessage}',
                    style: const TextStyle(color: Colors.redAccent))
              else ...[
                Row(
                  children: [
                    Expanded(
                      child: StatTile(
                        value: '${catalog.allDestinations.length}',
                        label: 'Destinos',
                        icon: Icons.place_outlined,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: StatTile(
                        value: '${catalog.categories.length}',
                        label: 'Categorías',
                        icon: Icons.category_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                AppPrimaryButton(
                  label: 'Explorar destinos',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
