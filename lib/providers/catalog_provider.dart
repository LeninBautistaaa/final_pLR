import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../data/repositories/tourism_repository.dart';
import '../models/category.dart';
import '../models/destination.dart';

enum LoadStatus { loading, ready, error }

/// Manejo de estado (Unidad 3): catálogo, búsqueda y favoritos.
class CatalogProvider extends ChangeNotifier {
  final TourismRepository _repository;

  CatalogProvider({TourismRepository? repository})
      : _repository = repository ?? TourismRepository();

  LoadStatus status = LoadStatus.loading;
  String? errorMessage;

  List<Destination> _destinations = [];
  List<Category> _categories = [];
  final Set<int> _favoriteIds = {};
  String _query = '';

  List<Category> get categories => _categories;
  List<Destination> get allDestinations => _destinations;
  int get favoritesCount => _favoriteIds.length;

  List<Destination> get filtered {
    if (_query.isEmpty) return _destinations;
    final q = _query.toLowerCase();
    return _destinations
        .where((d) =>
            d.name.toLowerCase().contains(q) ||
            d.region.toLowerCase().contains(q))
        .toList();
  }

  List<Destination> get favorites =>
      _destinations.where((d) => _favoriteIds.contains(d.id)).toList();

  List<Destination> byCategory(String categoryId) =>
      _destinations.where((d) => d.categoryId == categoryId).toList();

  Category? categoryOf(String id) {
    for (final c in _categories) {
      if (c.id == id) return c;
    }
    return null;
  }

  bool isFavorite(int id) => _favoriteIds.contains(id);

  Future<void> load() async {
    status = LoadStatus.loading;
    notifyListeners();
    try {
      _categories = await _repository.getCategories();
      _destinations = await _repository.getDestinations();
      status = LoadStatus.ready;
    } catch (e) {
      status = LoadStatus.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void search(String value) {
    _query = value.trim();
    notifyListeners();
  }

  void toggleFavorite(int id) {
    if (!_favoriteIds.remove(id)) _favoriteIds.add(id);
    notifyListeners();
  }
}
