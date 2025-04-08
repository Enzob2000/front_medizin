import 'package:flutter/material.dart';
import 'inicio.dart'; // Importa tu archivo inicio.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(), // ¡Pantalla inicial cambiada a inicio.dart!
    );
  }
}