
import 'package:flutter/material.dart';
import '../home.dart';
import '../filtros.dart';
import '../bottomNavigationBar/bottomNB.dart';
import 'CustomAppBar.dart';
import 'cuerpo.dart';

class Busqueda extends StatelessWidget {
  const Busqueda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador de Medicamentos',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: const MedicineSearchScreen(),
    );
  }
}

class MedicineSearchScreen extends StatefulWidget {
  final String? query;
  const MedicineSearchScreen({super.key, this.query});

  @override
  State<MedicineSearchScreen> createState() => _MedicineSearchScreenState();
}

class _MedicineSearchScreenState extends State<MedicineSearchScreen> {
  late TextEditingController _searchController;
  final FocusNode _focusNode = FocusNode();
  final List<String> _allMedicines = [
    "Pastilla dolor",
    "Pastilla antialérgico",
    "Pastilla Omega 3",
    "Pastilla Migraña",
    "Pastilla malestar general",
  ];

  List<String> _filteredMedicines = [];

  @override
  @override
  void initState() {
    super.initState();
    // Inicializa el controlador PRIMERO con el valor del query
    _searchController = TextEditingController(text: widget.query ?? '');

    // Luego configura el listener
    _searchController.addListener(_filterMedicines);

    // Finalmente filtra los resultados iniciales
    _filteredMedicines = _allMedicines;
    if (widget.query != null && widget.query!.isNotEmpty) {
      _filterMedicines(); // Filtra inmediatamente si hay query inicial
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  void _filterMedicines() {
    final query = _searchController.text.toLowerCase().trim();

    setState(() {
      _filteredMedicines =
          query.isEmpty
              ? _allMedicines
              : _allMedicines.where((medicine) {
                final medLower = medicine.toLowerCase();
                // Búsqueda por palabras parciales
                return query.split(' ').any((word) => medLower.contains(word));
              }).toList();
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: cuerpo(searchController: _searchController, focusNode: _focusNode, filteredMedicines: _filteredMedicines, imagePaths: imagePaths),
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

