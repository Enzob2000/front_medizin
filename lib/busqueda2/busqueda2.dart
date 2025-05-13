import 'package:flutter/material.dart';
//import '../home.dart';
import '../producto.dart';
import '../bottomNavigationBar/bottomNB.dart';
import 'CustomAppBar.dart';
import 'producto_class.dart';
import 'cuerpo.dart';

void main() {
  runApp(const Busqueda2());
}



final List<String> imagePaths = [
  'assets/producto1.png',
  'assets/producto2.png',
  'assets/producto3.png',
];

class Busqueda2 extends StatelessWidget {
  const Busqueda2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador de Medicamentos',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: const MedicineSearchScreen2(),
    );
  }
}

class MedicineSearchScreen2 extends StatefulWidget {
  final String? query;
  const MedicineSearchScreen2({super.key, this.query});

  @override
  State<MedicineSearchScreen2> createState() => _MedicineSearchScreenState();
}

class _MedicineSearchScreenState extends State<MedicineSearchScreen2> {
  late TextEditingController _searchController;
  final FocusNode _focusNode = FocusNode();
  

  @override
  @override
  void initState() {
    super.initState();
    // Inicializa el controlador PRIMERO con el valor del query
    _searchController = TextEditingController(text: widget.query ?? '');

    // Luego configura el listener

    // Finalmente filtra los resultados iniciales

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
    _focusNode.dispose();
  }

  int _currentIndex = 0;

  final List<String> imagePaths = [
    'assets/producto1.png',
    'assets/producto2.png',
    'assets/producto3.png',
  ];

  List<String> _resultados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: cuerpo(searchController: _searchController, focusNode: _focusNode),
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


