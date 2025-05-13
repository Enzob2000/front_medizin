import 'package:flutter/material.dart';
import 'producto_class.dart';
import 'productCard.dart';

class Cuerpo extends StatelessWidget {

  const Cuerpo(List<Product> products, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 5,
                childAspectRatio: 0.87
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
    );
  }
}