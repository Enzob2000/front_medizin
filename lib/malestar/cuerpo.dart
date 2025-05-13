import 'package:flutter/material.dart';
import 'producto_class.dart';
import 'productCard.dart';

class cuerpo extends StatelessWidget {
  const cuerpo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
    Container(
      padding: EdgeInsets.only(left: 15,right: 15) ,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ // Espacio entre los textos
          TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Categorias()),
                // );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                backgroundColor: const Color.fromARGB(255, 227, 227, 227),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              child: const Text(
                "Dolor Muscular y Articular",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color:  Color.fromARGB(255, 114, 109,109) // Texto en blanco para mejor contraste
                ),
              ),
            ),
            SizedBox(width: 10),
            TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Categorias()),
                // );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                backgroundColor: const Color.fromARGB(255, 0, 87, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              child: const Text(
                "Analgésico y Antipirético",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color:  Color.fromARGB(255, 255, 255,255) // Texto en blanco para mejor contraste
                ),
              ),
            ),
             
        ],
      ),
    ),
        ],
      ),
    ),Center(
      child: TextButton(
          onPressed: () {
            // Lógica para ordenar
          },
          child: const Text('Ordenar por precio ↑↓',
          style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color:  Color.fromARGB(255, 67, 67,67) // Texto en blanco para mejor contraste
                ),),
          ),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 5,
                childAspectRatio: 0.65
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child:  productCard3(product: products[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

