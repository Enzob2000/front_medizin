import 'package:flutter/material.dart';

import 'producto_class.dart';
import 'CustomAppBar.dart';
import '../bottomNavigationBar/bottomNB.dart';

import 'cuerpo.dart';

void main() {
  runApp(const Farmacia());
}

class Farmacia extends StatelessWidget {
  const Farmacia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malestar General',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', 
      ),
      home: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: cuerpo(),
      bottomNavigationBar: BNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

