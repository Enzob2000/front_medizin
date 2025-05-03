import 'package:flutter/material.dart';
import '../home.dart';
import '../filtros.dart';

class cuerpo extends StatelessWidget {
  const cuerpo({
    super.key,
    required TextEditingController searchController,
    required FocusNode focusNode,
    required List<String> filteredMedicines,
    required this.imagePaths,
  }) : _searchController = searchController, _focusNode = focusNode, _filteredMedicines = filteredMedicines;

  final TextEditingController _searchController;
  final FocusNode _focusNode;
  final List<String> _filteredMedicines;
  final List<String> imagePaths;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 5.0),
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
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 67, 67, 67),
                    ),
                    filled: true,
    
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
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
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 197, 197, 197),
                        width: 1,
                      ),
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
                  icon: const Icon(
                    Icons.tune,
                    color: Color.fromARGB(255, 67, 67, 67),
                    size: 26,
                  ),
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
                  shrinkWrap:
                      true, // Necesario dentro de SingleChildScrollView
                  physics:
                      const NeverScrollableScrollPhysics(), // Deshabilita el scroll interno
                  itemCount: _filteredMedicines.length,
                  itemBuilder: (context, index) {
                    final medicine = _filteredMedicines[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26.0,
                        vertical: 1.0,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          icon: const Icon(
                            Icons.search_outlined,
                            color: Colors.blue,
                            size: 26,
                          ),
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
                  padding: EdgeInsets.only(
                    left: 15.0,
                    top: 16.0,
                    right: 15.0,
                    bottom: 8.0,
                  ),
                  child: Align(
                    alignment:
                        Alignment.centerLeft, // Fuerza alineación izquierda
                    child: Text(
                      "Recomendados para ti",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 67, 67, 67),
                      ),
                    ),
                  ),
                ),
    
                // Carruseles (mantienen el mismo código)
                SizedBox(
                  height: 160,
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 0.55),
                    padEnds: false,
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 15.0,
                        ),
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
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 15.0,
                        ),
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
    );
  }
}

