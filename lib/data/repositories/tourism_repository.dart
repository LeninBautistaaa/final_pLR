import '../../models/category.dart';
import '../../models/destination.dart';
import '../datasources/local_json_datasource.dart';

/// Repositorio: convierte el JSON crudo en modelos del dominio.
class TourismRepository {
  final LocalJsonDatasource _datasource;

  TourismRepository({LocalJsonDatasource? datasource})
      : _datasource = datasource ?? LocalJsonDatasource();

  Future<List<Category>> getCategories() async {
    final rows =
        await _datasource.readList('assets/data/categorias.json', 'categorias');
    return rows.map(Category.fromJson).toList();
  }

  Future<List<Destination>> getDestinations() async {
    final rows =
        await _datasource.readList('assets/data/destinos.json', 'destinos');
    return rows.map(Destination.fromJson).toList();
  }
}
