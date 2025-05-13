import 'package:flutter/material.dart';

class AppTheme {
  final Color appBarColor;
  final Color primaryColor;
  final Color secondaryColor;

  // Constructor con valores por defecto
  AppTheme({
    this.appBarColor = const Color.fromARGB(255, 30, 217, 236),
    this.primaryColor = const Color.fromARGB(255, 0, 87, 255),
    this.secondaryColor = const Color.fromARGB(255, 30, 217, 236),
  });

  ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Poppins',
      primaryColor: primaryColor,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black), // Color de íconos
        titleTextStyle: const TextStyle(
          color: Colors.black, // Color del texto
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Puedes añadir más personalizaciones aquí
    );
  }
}
