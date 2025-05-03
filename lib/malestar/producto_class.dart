class Product {
  final String name,imagePath,link,categoria,precioAnt,
  precioDesc;

  const Product({
    required this.name,
    required this.imagePath,
    required this.link,
    required this.categoria,
    required this.precioAnt,
    required this.precioDesc,
  });
}

final List<Product> products = const [
    Product(categoria: 'Farmacia y Salud', name: 'Acetaminofén 650Mg X10 Tabletas', imagePath: 'assets/acetaminofen_650mg.png', link: 'Farmacia()', precioAnt: 'Bs. 50,99',precioDesc: 'Bs. 35,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Acetaminofén 500mg 10Tabletas Genven', imagePath: 'assets/acetaminofen_500mg.png', link: '', precioAnt: 'Bs. 60,99',precioDesc: 'Bs. 45,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Torsilax 10 Comprimidos', imagePath: 'assets/torsilax.png', link: '', precioAnt: 'Bs. 90,99',precioDesc: 'Bs. 69,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Atamel Acetaminofén 500 mg x 20 Tabletas', imagePath: 'assets/atamel.png', link: '', precioAnt: 'Bs. 150,99',precioDesc: 'Bs. 120,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Torsilax 10 Comprimidos', imagePath: 'assets/torsilax.png', link: '', precioAnt: 'Bs. 90,99',precioDesc: 'Bs. 69,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Atamel Acetaminofén 500 mg x 20 Tabletas', imagePath: 'assets/atamel.png', link: '', precioAnt: 'Bs. 150,99',precioDesc: 'Bs. 120,99'),
    ];