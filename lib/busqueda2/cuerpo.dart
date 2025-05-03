import 'package:flutter/material.dart';
import 'producto_class.dart';
import 'productCard.dart';

class cuerpo extends StatelessWidget {
  const cuerpo({
    super.key,
    required TextEditingController searchController,
    required FocusNode focusNode,
  }) : _searchController = searchController, _focusNode = focusNode;

  final TextEditingController _searchController;
  final FocusNode _focusNode;

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
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homes()),
              );*/
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
        SizedBox(height: 20),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 35),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 87, 255),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            hintText: 'Buscar medicamento...',
                            suffixIcon: const Icon(
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
                      const SizedBox(width: 2),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 26,
                          ),
                          onPressed: () {
                            // Acción del filtro
                          },
                          padding: const EdgeInsets.all(1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.64,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: productCard(products[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  

}
