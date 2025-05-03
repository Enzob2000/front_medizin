import 'package:flutter/material.dart';

import 'cuerpo.dart';
import 'package:front_medizin/bottomNavigationBar/bottomNB.dart';
import 'CustomAppBar.dart';

void main() {
  runApp(const Malestar());
}

class Malestar extends StatelessWidget {
  const Malestar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categorias',
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

