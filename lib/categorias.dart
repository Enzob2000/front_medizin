import 'package:flutter/material.dart';
import 'home.dart';
import 'farmacia.dart';

void main() {
  runApp(const Categorias());
}

class Categorias extends StatelessWidget {
  const Categorias({super.key});

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
  final String name;
  final String imagePath;
  final String link;

  const Product({
    required this.name,
    required this.imagePath,
    required this.link
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
    Product(name: 'Farmacia y\nSalud', imagePath: 'assets/farmacia2.png', link: 'Farmacia()'),
    Product(name: 'Belleza', imagePath: 'assets/siencere2.png', link: ''),
    Product(name: 'Cuidado \nPersonal', imagePath: 'assets/higiene2.png', link: ''),
    Product(name: 'Bebé', imagePath: 'assets/bebe2.png', link: ''),
    Product(name: 'Alimentos\ny Bebidas', imagePath: 'assets/snack2.png', link: ''),
    Product(name: 'Hogar \ny Otros', imagePath: 'assets/hogar2.png', link: ''),
  ];

  final List<Category> categories = const [
    Category(name: 'Farmacia', image: 'assets/farmacia.png'),
    Category(name: 'Salud', image: 'assets/salud.png'),
    Category(name: 'Higiene', image: 'assets/higiene.png'),
    Category(name: 'Bebé', image: 'assets/bebe.png'),
    Category(name: 'Skincare', image: 'assets/siencere.png'),
    Category(name: 'Snack y Bebidas', image: 'assets/snack.png'),
    Category(name: 'Salud bucal', image: 'assets/bucal.png'),
    Category(name: 'Hogar', image: 'assets/hogar.png'),
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

  Widget _getPageFromProduct(Product product) {
  switch(product.link) {
    case 'farmacia':
      return Farmacia();
    default:
      return Farmacia();
  }
}

  Widget _buildProductCard(Product product) {
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
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 90.0,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 25.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 87, 255)),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 40, maxWidth: 40),
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homes()),
                  );
                },
              ),
        
            ],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Text("Categorías",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 0, 87, 255),
              ),)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: IconButton(
              icon: const Icon(Icons.search_outlined, color: Color.fromARGB(255, 0, 87, 255)),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: Color.fromARGB(255, 0, 87, 255)),
              onPressed: () {},
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.87
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