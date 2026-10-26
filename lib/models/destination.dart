class Destination {
  final int id;
  final String name;
  final String region;
  final String categoryId;
  final String description;
  final String imageUrl;
  final double rating;
  final int priceMxn;
  final String bestSeason;
  final List<String> activities;

  const Destination({
    required this.id,
    required this.name,
    required this.region,
    required this.categoryId,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.priceMxn,
    required this.bestSeason,
    required this.activities,
  });

  /// Mapeo estricto JSON -> objeto tipado.
  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'] as int,
      name: json['nombre'] as String,
      region: json['region'] as String,
      categoryId: json['categoriaId'] as String,
      description: json['descripcion'] as String,
      imageUrl: json['imagenUrl'] as String,
      rating: (json['calificacion'] as num).toDouble(),
      priceMxn: json['precioMxn'] as int,
      bestSeason: json['mejorEpoca'] as String,
      activities: (json['actividades'] as List<dynamic>).cast<String>(),
    );
  }

  bool get isFree => priceMxn == 0;
}
