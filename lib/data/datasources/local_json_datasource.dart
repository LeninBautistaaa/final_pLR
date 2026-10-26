import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

/// Capa de datos: solo sabe leer archivos JSON de los assets.
class LocalJsonDatasource {
  Future<List<Map<String, dynamic>>> readList(String path, String key) async {
    final raw = await rootBundle.loadString(path);
    final decoded = json.decode(raw) as Map<String, dynamic>;
    return (decoded[key] as List<dynamic>).cast<Map<String, dynamic>>();
  }
}
