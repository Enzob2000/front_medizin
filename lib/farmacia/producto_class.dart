class Product {
  final String name;
  final String imagePath;
  final String link;

  const Product({
    required this.name,
    required this.imagePath,
    required this.link
  });
}

final List<Product> products = const [
    Product(name: 'Malestar\nGeneral', imagePath: 'assets/farmacia2.png' , link: 'Malestar()'),
    Product(name: 'Salud\nRespiratoria', imagePath: 'assets/siencere2.png' , link: ''),
    Product(name: 'Primeros \nAuxilios', imagePath: 'assets/higiene2.png' , link: ''),
    Product(name: 'Salud\nDigestiva', imagePath: 'assets/bebe2.png' , link: ''),
    Product(name: 'Nutrición\ny Bienestar', imagePath: 'assets/snack2.png' , link: ''),
    Product(name: 'Vitaminas y\nSuplementos', imagePath: 'assets/hogar2.png' , link: ''),
  ];