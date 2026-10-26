# Oaxaca Turismo

App Flutter de catálogo de destinos turísticos de Oaxaca (Práctica Unidad 3 – Desarrollo de Aplicaciones Móviles).

## Cómo ejecutar
```bash
# 1) Dentro de esta carpeta, genera las carpetas de plataforma (android/ios/etc.)
flutter create . --project-name oaxaca_turismo
# 2) Instala dependencias y ejecuta
flutter pub get
flutter run
```
> `flutter create .` NO sobrescribe `lib/`, `pubspec.yaml` ni `assets/`. Si pregunta, conserva los existentes.

## Arquitectura (por capas)
```
lib/
├── core/          # Tema (paleta suave) y utilidades
├── models/        # Category, Destination (fromJson estricto)
├── data/
│   ├── datasources/   # LocalJsonDatasource (lee assets JSON)
│   └── repositories/  # TourismRepository (JSON -> modelos)
├── providers/     # CatalogProvider (estado: carga, búsqueda, favoritos)
├── screens/       # 6 pantallas
└── widgets/       # 14 custom widgets reutilizables
```
Flujo de datos: `JSON (assets) → Datasource → Repository → Provider → Screens → Widgets`.

## Pantallas (Navigator.push / pop)
1. WelcomeScreen  2. HomeScreen  3. DetailScreen  4. FavoritesScreen  5. CategoriesScreen  6. CategoryResultsScreen

## Custom widgets (14)
NetworkImageSafe, RatingBadge, PriceTag, FavoriteButton, SectionTitle, InfoRow, ActivityChip, CategoryChip, CategoryTile, DestinationCard, AppSearchField, EmptyState, StatTile, AppPrimaryButton.

## Datos
`assets/data/categorias.json` y `assets/data/destinos.json`, con imágenes remotas (`imagenUrl`). Puedes sustituir las URLs por fotos reales de cada lugar.
