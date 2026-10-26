class Category {
  final String id;
  final String name;
  final String icon;
  final String description;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
  });

  /// Mapeo estricto: si falta un campo o el tipo es incorrecto, lanza error.
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['nombre'] as String,
      icon: json['icono'] as String,
      description: json['descripcion'] as String,
    );
  }
}
