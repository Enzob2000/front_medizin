import 'package:flutter/material.dart';
import 'package:front_medizin/home.dart';
import 'inicio.dart'; // 
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