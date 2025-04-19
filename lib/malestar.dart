import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const Malestar());
}

class Malestar extends StatelessWidget {
  const Malestar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categorias',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', 
      ),
      home: const SearchScreen(),
    );
  }
}

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

class Category {
  final String name;
  final String image;

  const Category({
    required this.name,
    required this.image,
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;
  
  final List<String> imagePaths = [
    'assets/producto1.png',
    'assets/producto2.png',
    'assets/producto3.png',
  ];

  final List<Product> products = const [
    Product(categoria: 'Farmacia y Salud', name: 'Acetaminofén 650Mg X10 Tabletas', imagePath: 'assets/acetaminofen_650mg.png', link: 'Farmacia()', precioAnt: 'Bs. 50,99',precioDesc: 'Bs. 35,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Acetaminofén 500mg 10Tabletas Genven', imagePath: 'assets/acetaminofen_500mg.png', link: '', precioAnt: 'Bs. 60,99',precioDesc: 'Bs. 45,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Torsilax 10 Comprimidos', imagePath: 'assets/torsilax.png', link: '', precioAnt: 'Bs. 90,99',precioDesc: 'Bs. 69,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Atamel Acetaminofén 500 mg x 20 Tabletas', imagePath: 'assets/atamel.png', link: '', precioAnt: 'Bs. 150,99',precioDesc: 'Bs. 120,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Torsilax 10 Comprimidos', imagePath: 'assets/torsilax.png', link: '', precioAnt: 'Bs. 90,99',precioDesc: 'Bs. 69,99'),
    Product(categoria: 'Farmacia y Salud', name: 'Atamel Acetaminofén 500 mg x 20 Tabletas', imagePath: 'assets/atamel.png', link: '', precioAnt: 'Bs. 150,99',precioDesc: 'Bs. 120,99'),
    ];



  final List<BottomNavigationBarItem> _menuItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category_outlined),
      label: 'Categoría',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border),
      label: 'Favoritos',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.credit_card_outlined),
      label: 'Creditos',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.monitor_heart_outlined),
      label: 'Servicios',
    ),
  ];

 Widget _buildProductCard(Product product) {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.only(bottom: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(
        color: Colors.grey[300]!,
        width: 1,
      )
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        // Acción al hacer clic en el producto
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
                  onTap: () {
                    // Acción al hacer clic
                  },
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
                            color: const Color.fromARGB(255, 139, 139, 139),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 87, 255),
        elevation: 0,
        toolbarHeight: 90.0,
        leadingWidth: 90,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 25.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                padding: EdgeInsets.zero,
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homes()),
                  );
                },
              )
            ],
          ),
        ),
        title: Center(
          child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Text("Malestar General",
              style: TextStyle(
                fontSize: 16 ,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),maxLines: 1,
              textAlign: TextAlign.right)
        ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: IconButton(
              icon: const Icon(Icons.search_outlined, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: 
      
      SingleChildScrollView(
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
                    child:  _buildProductCard(products[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuItems,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white, 
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}