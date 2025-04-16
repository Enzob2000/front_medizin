import 'package:flutter/material.dart';
import 'package:front_medizin/home.dart';
import 'inicio.dart'; // Importa tu archivo inicio.dart
import 'malestar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Malestar(), // ¡Pantalla inicial cambiada a inicio.dart!
    );
  }
}