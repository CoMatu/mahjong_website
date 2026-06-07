import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const primary = Color(0xFF75B092);
  static const primaryDark = Color(0xFF4E8C6A);
  static const surface = Color(0xFFFFFBF1);
  static const text = Color(0xFF193126);

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      primary: primaryDark,
      surface: surface,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: surface,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'RussoOne',
          color: text,
          fontSize: 46,
          height: 1.08,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'RussoOne',
          color: text,
          fontSize: 28,
          height: 1.16,
        ),
        titleLarge: TextStyle(
          fontFamily: 'RussoOne',
          color: text,
          fontSize: 20,
        ),
        bodyLarge: TextStyle(color: text, fontSize: 17, height: 1.48),
        bodyMedium: TextStyle(color: text, fontSize: 15, height: 1.45),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryDark,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white.withValues(alpha: 0.82),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
