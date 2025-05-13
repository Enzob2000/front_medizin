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
    Product(name: 'Farmacia y\nSalud', imagePath: 'assets/farmacia2.png', link: 'Farmacia()'),
    Product(name: 'Belleza', imagePath: 'assets/siencere2.png', link: ''),
    Product(name: 'Cuidado \nPersonal', imagePath: 'assets/higiene2.png', link: ''),
    Product(name: 'Bebé', imagePath: 'assets/bebe2.png', link: ''),
    Product(name: 'Alimentos\ny Bebidas', imagePath: 'assets/snack2.png', link: ''),
    Product(name: 'Hogar \ny Otros', imagePath: 'assets/hogar2.png', link: ''),
  ];