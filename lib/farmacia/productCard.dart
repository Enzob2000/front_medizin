import 'package:flutter/material.dart';
import 'producto_class.dart';
import '../malestar/malestar.dart';

Widget _getPageFromProduct(Product product) {
  switch(product.link) {
    case 'Malestar()':
      return Malestar(); //cambiar a malestar
    default:
      return Malestar();
  }
}

class productCard2 extends StatelessWidget {
  const productCard2({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 0, 87, 255),
      margin: const EdgeInsets.only(bottom: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        
        onTap: () {
          final page = _getPageFromProduct(product);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Padding(
          
          padding: const EdgeInsets.only(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  const SizedBox(height: 0),
                  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: GestureDetector(
          onTap: () {
            // Acción al hacer clic
          },
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[700],
                decoration: TextDecoration.lineThrough,
              ),
              children: [
                TextSpan(
                  text: product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: 'Poppins',
                    height: 1.0
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
          Icons.arrow_circle_right_rounded,
          color: Colors.white,
          size: 32,
        ),
      ),
    ],
  ),
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

