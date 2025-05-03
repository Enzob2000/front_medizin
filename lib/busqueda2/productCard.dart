import 'package:flutter/material.dart';
import 'producto_class.dart';
import '../producto.dart';

class productCard extends StatelessWidget{
  Product product;
  
  productCard(Product product, {super.key}):product = product;

 Widget build(BuildContext context) {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.only(bottom: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(color: Colors.grey[300]!, width: 1),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Producto()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenedor de la imagen con corazón
            Center(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product.imagePath,
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 1,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Color.fromARGB(255, 0, 87, 255),
                          size: 20,
                        ),
                        onPressed: () {
                          // Lógica para marcar como favorito
                        },
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(5, 5),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 2),

            // Información del producto
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.categoria,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 0),

                // Precios y botón de añadir
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[700],
                              decoration: TextDecoration.lineThrough,
                            ),
                            children: [
                              TextSpan(
                                text: "${product.precioAnt}\n",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: const Color.fromARGB(
                                    255,
                                    139,
                                    139,
                                    139,
                                  ),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text: product.precioDesc,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 0, 87, 255),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        print("Producto añadido");
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}