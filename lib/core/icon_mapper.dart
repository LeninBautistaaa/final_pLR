import 'package:flutter/material.dart';

/// Traduce el nombre de ícono del JSON a un [IconData] de Flutter.
IconData iconFromName(String name) {
  switch (name) {
    case 'museum':
      return Icons.account_balance_outlined;
    case 'park':
      return Icons.park_outlined;
    case 'beach':
      return Icons.beach_access_outlined;
    case 'food':
      return Icons.restaurant_outlined;
    default:
      return Icons.place_outlined;
  }
}
