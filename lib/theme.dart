import 'package:flutter/material.dart';

class MiUnadTheme {
  static const Color seedColor = Color(0xFF0E5A38);
  static const Color primaryGreen = Color(0xFF0E5A38);
  static const Color backgroundLight = Color(0xFFF9F8F5);
  static const Color textDark = Color(0xFF173726);
  static const Color textLight = Color(0xFF62716A);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      navigationBarTheme: NavigationBarThemeData(
        height: 74,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        backgroundColor: backgroundLight.withValues(alpha: 0.96),
        indicatorColor: primaryGreen.withValues(alpha: 0.12),
        elevation: 0,
      ),
    );
  }
}
