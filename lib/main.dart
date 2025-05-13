import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:front_medizin/iniciarsesion/iniciarsesion.dart';
import 'Inicio/inicio.dart';
=======
import 'package:front_medizin/home.dart';
import 'inicio.dart';
import 'categorias/categorias.dart'; // 
>>>>>>> ba9a93d2ecd0d5ae37da85581f4d2a89fcc44454
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Categorias(), 
    );
  }
}