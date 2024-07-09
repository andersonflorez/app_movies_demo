import 'package:flutter/material.dart';

class AppTheme {
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.purple,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: Colors.grey[700],
    canvasColor: Colors.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
  );

  final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[100],
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.black,
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.purple),
  );
}
