import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(Filtros());
}

class Filtros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filtros de Productos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', 
      ),
      home: FilterScreen(),
    );
  }
}

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Variables para almacenar los estados de los checkboxes
  Map<String, bool> categorias = {
    'Medicamentos': false,
    'Skin care': false,
    'Cuidado personal': false,
    'Bebes': false,
    'Snack': false,
    'Bebidas': false,
    'Hogar': false,
  };

  Map<String, bool> precios = {
    'Menos de 100Bss': false,
    '101 a 500Bss': false,
    '501 a 1000Bss': false,
    'Más de 1000Bss': false,
  };

  Map<String, bool> entrega = {
    'Pick Up': false,
    'Delivery': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  automaticallyImplyLeading: false, // Elimina el ícono de retroceso por defecto
  titleSpacing: 0, // Elimina el espacio adicional del título
  leadingWidth: 100,
  toolbarHeight: 60.0, // Ancho personalizado para el leading
  leading: Padding(
    padding: const EdgeInsets.only(left: 16.0), // Ajuste de padding izquierdo
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back,
            size: 16,
            color: Color.fromARGB(255, 0, 87, 255),
          ),
          SizedBox(width: 4),
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
),
      body: Column(
  children: [
    // Botón "Ordenar" centrado
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Center(
        child: TextButton(
          onPressed: () {
            // Lógica para ordenar
          },
          child: const Text(
            'Filtros',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 0, 87, 255),
            ),
          ),
        ),
      ),
    ),
    
    // Lista de filtros con scroll
    Expanded(
      child: Container(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 15),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 242, 243, 242),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Categorias'),
            _buildCheckboxList(categorias),
            
            SizedBox(height: 24),
            _buildSectionTitle('Precios'),
            _buildCheckboxList(precios),
            
            SizedBox(height: 24),
            _buildSectionTitle('Entrega'),
            _buildCheckboxList(entrega),
            
            SizedBox(height: 32),
          ],
        ),
      ),
    ),
    ),
  ],
)
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 24, 23, 37),
        ),
      ),
    );
  }

  Widget _buildCheckboxList(Map<String, bool> items) {
  return Column(
    children: items.entries.map((entry) {
      return SizedBox(  // Widget adicional para controlar altura
        height: 36,  // Altura reducida del ítem
        child: CheckboxListTile(
          title: Transform.translate(
            offset: Offset(-14, 0),  // Ajusta posición del texto
            child: Text(
              entry.key,
              style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 67, 67, 67)),  // Tamaño de texto opcional
            ),
          ),
          value: entry.value,
          onChanged: (bool? value) {
            setState(() {
              items[entry.key] = value ?? false;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,  // Elimina todo el padding interno
          dense: true,  // Hace el tile más compacto
          visualDensity: VisualDensity.compact,  // Reduce espacio visual
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,  // Área de toque mínima
        ),
      );
    }).toList(),
  );
}

  List<String> _getSelectedItems(Map<String, bool> items) {
    return items.entries.where((entry) => entry.value).map((entry) => entry.key).toList();
  }
}