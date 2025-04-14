import 'package:flutter/material.dart';
import 'inicio.dart'; // Importa tu archivo inicio.dart
import 'home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homes(), // ¡Pantalla inicial cambiada a inicio.dart!
    );
  }
}