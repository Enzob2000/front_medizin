import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Poppins',
      primaryColor: const Color.fromARGB(255, 0, 87, 255),
      colorScheme: ColorScheme.light(
        primary: const Color.fromARGB(255, 0, 87, 255),
        secondary: const Color.fromARGB(255, 30, 217, 236),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          return states.contains(MaterialState.selected)
              ? Colors.black
              : Colors.transparent;
        }),
      ),
    );
  }
}
