import 'dart:convert';

import 'package:flutter/material.dart';
import 'home.dart';
import 'filtros.dart';

void main() {
  runApp(const Busqueda());
}


final List<String> imagePaths = [
    'assets/producto1.png',
    'assets/producto2.png',
    'assets/producto3.png',
  ];
class Busqueda extends StatelessWidget {
   
   const Busqueda({
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador de Medicamentos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', 
      ),
      home: const MedicineSearchScreen(),
    );
  }
}

class MedicineSearchScreen extends StatefulWidget {
  final String? query;
  const MedicineSearchScreen({super.key,
    this.query});
  
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
    _filteredMedicines = query.isEmpty 
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

  final PageController _pageController = PageController(viewportFraction: 0.8);
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 90.0,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 25.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: Color.fromARGB(255, 0, 87, 255)),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: Color.fromARGB(255, 0, 87, 255)),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                onPressed: () {},
              ),
            ],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Image.asset(
            'assets/logo.png',
            height: 80.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: IconButton(
              icon: Icon(Icons.account_circle_outlined, color: Color.fromARGB(255, 0, 87, 255)),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Color.fromARGB(255, 0, 87, 255)),
              onPressed: () {},
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
            padding: const EdgeInsets.only(left: 25.0,top: 5.0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homes()),
                  );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  
                  Icon(
                    Icons.arrow_back,
                    size: 16,
                    color: Color.fromARGB(255, 0, 87, 255),
                  ),SizedBox(width: 4),
                  Text(
                    'Volver',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 0, 87, 255),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          Padding(
  padding: const EdgeInsets.all(16.0),
  child: Row(
    children: [
      Expanded(
        child: TextField(
          controller: _searchController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: 'Buscar medicamento...',
            prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 67, 67, 67)),
            filled: true,
             
            fillColor: Colors.grey[100],
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color.fromARGB(255, 197, 197, 197), width: 1),
            ),
          ),
        ),
      ),
      const SizedBox(width: 1),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          icon: const Icon(Icons.tune, color: Color.fromARGB(255, 67, 67, 67), size: 26),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Filtros()),
                  );
          },
          padding: const EdgeInsets.all(12),
        ),
      ),
    ],
  ),
),     
          Expanded(
  child: SingleChildScrollView(
    child: Column(
      children: [
        // Lista de resultados de búsqueda (sin Expanded interno)
        ListView.builder(
          shrinkWrap: true,  // Necesario dentro de SingleChildScrollView
          physics: const NeverScrollableScrollPhysics(),  // Deshabilita el scroll interno
          itemCount: _filteredMedicines.length,
          itemBuilder: (context, index) {
            final medicine = _filteredMedicines[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 1.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  icon: const Icon(Icons.search_outlined, color: Colors.blue, size: 26),
                  label: Text(
                    medicine,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 121, 124, 128),
                    ),
                  ),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
            );
          },
        ),
        
        // Resto del contenido (secciones de recomendados)
        const Padding(
  padding: EdgeInsets.only(left: 15.0, top: 16.0, right: 15.0, bottom: 8.0),
  child: Align(
    alignment: Alignment.centerLeft, // Fuerza alineación izquierda
    child: Text(
      "Recomendados para ti",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 67, 67, 67),
    ),
  ),
),),
        
        // Carruseles (mantienen el mismo código)
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.55),
            padEnds: false,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePaths[index],
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        
        const SizedBox(height: 5.0),
        
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.55),
            padEnds: false,
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePaths[index],
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  ),
),
              ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            //top: BorderSide(color: Colors.black, width: 1.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10.0,
              offset: Offset(0, -2)
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14.5),
            topRight: Radius.circular(14.5),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14.5),
            topRight: Radius.circular(14.5),
          ),
          child: BottomNavigationBar(
            items: _menuItems,
            currentIndex: _currentIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),);
    
  }
}

final List<BottomNavigationBarItem> _menuItems = [
    BottomNavigationBarItem(
      icon: Image.asset('assets/inicio.png', width: 24, height: 24),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/categoria.png', width: 24, height: 24),
      label: 'Categoría',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/favoritos.png', width: 24, height: 24),
      label: 'Favoritos',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/creditos.png', width: 24, height: 24),
      label: 'Creditos',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/servicios.png', width: 24, height: 24),
      label: 'Servicios',
    ),
  ];
