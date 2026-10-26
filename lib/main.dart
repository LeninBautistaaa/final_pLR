import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app_theme.dart';
import 'providers/catalog_provider.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CatalogProvider()..load(),
      child: const OaxacaTurismoApp(),
    ),
  );
}

class OaxacaTurismoApp extends StatelessWidget {
  const OaxacaTurismoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oaxaca Turismo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const WelcomeScreen(),
    );
  }
}
