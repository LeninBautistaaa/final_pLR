import 'package:flutter/material.dart';

/// Paleta suave y sobria de la aplicación.
class AppColors {
  static const primary = Color(0xFF5B8E7D); // verde salvia
  static const accent = Color(0xFFD9A066); // arena
  static const background = Color(0xFFF7F5F0);
  static const surface = Colors.white;
  static const textDark = Color(0xFF2F3E46);
  static const textMuted = Color(0xFF6B7A80);
}

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: AppColors.surface,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.textDark,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: AppColors.textDark,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark),
          titleMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark),
          bodyMedium:
              TextStyle(fontSize: 14, height: 1.5, color: AppColors.textDark),
          bodySmall: TextStyle(fontSize: 12, color: AppColors.textMuted),
        ),
      );
}
