import 'package:flutter/material.dart';
import 'package:radioapp/core/colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,

    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: primary,
      surface: dark,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
    ),

    cardTheme: CardThemeData(
      color: dark,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(fontSize: 16, color: white),
      bodyMedium: TextStyle(fontSize: 14, color: gray),
    ),

    iconTheme: const IconThemeData(color: Colors.white),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: black,
      selectedItemColor: primary,
      unselectedItemColor: gray,
      type: BottomNavigationBarType.fixed,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    ),

    sliderTheme: SliderThemeData(
      activeTrackColor: primary,
      inactiveTrackColor: Colors.white24,
      thumbColor: primary,
      overlayColor: primary.withValues(alpha: 0.2),
    ),
  );
}
