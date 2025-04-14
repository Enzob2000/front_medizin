import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(Homes());
}

class Homes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de Búsqueda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen(),
    );
  }
}

class Category {
  final String name;
  final String image;

  Category({
    required this.name,
    required this.image,
  });
}

class Marca {
  final String name;
  final String image;

  Marca({
    required this.name,
    required this.image,
  });
}
//Marca
class MarcaButton extends StatelessWidget {
  final Marca marca;

  const MarcaButton({Key? key, required this.marca}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 106,
            height: 78,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Center(
                child: Image.asset(
                  marca.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              marca.name,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
//Categoria
class CategoryButton extends StatelessWidget {
  final Category category;

  const CategoryButton({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Center(
                child: Image.asset(
                  category.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              category.name,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String category;
  final String name;
  final String originalPrice;
  final String discountPrice;
  final String imagePath;

  Product({
    required this.category,
    required this.name,
    required this.originalPrice,
    required this.discountPrice,
    required this.imagePath,
  });
}

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmacia y Salud'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

//Medicamentos
Widget _buildProductCard(Product product) {
  return Card(
    color: Colors.white,
    margin: EdgeInsets.only(bottom: 36),
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
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
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
            SizedBox(height: 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 0),
                Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    GestureDetector(
      onTap: () {
        // Add your onTap functionality here
      },
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[700],
                decoration: TextDecoration.lineThrough,
              ),
              children: [
                TextSpan(
                  text: "${product.originalPrice}\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Color.fromARGB(255, 139, 139, 139),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text: product.discountPrice,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 0, 87, 255),
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ],
      ),
    ),
    IconButton(
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

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildProductCard(product);
  }
}

final List<Product> products = [
  Product(
    category: 'Farmacia y Salud',
    name: 'Acetaminofen 650Mg X 10 Tabletas',
    originalPrice: 'Bs. 50,99',
    discountPrice: 'Bs. 35,99',
    imagePath: 'assets/acetaminofen_650mg.png',
  ),
  Product(
    category: 'Farmacia y Salud',
    name: 'Acetaminofen 500mg 10 tabletas Genven',
    originalPrice: 'Bs. 60,99',
    discountPrice: 'Bs. 45,99',
    imagePath: 'assets/acetaminofen_500mg.png',
  ),
];

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;
  
  final List<String> imagePaths = [
    'assets/producto1.png',
    'assets/producto2.png',
    'assets/producto3.png',
  ];

  final List<Category> categories = [
    Category(name: 'Farmacia', image: 'assets/farmacia.png'),
    Category(name: 'Salud', image: 'assets/salud.png'),
    Category(name: 'Higiene', image: 'assets/higiene.png'),
    Category(name: 'Bebé', image: 'assets/bebe.png'),
    Category(name: 'Skincare', image: 'assets/siencere.png'),
    Category(name: 'Snack y Bebidas', image: 'assets/snack.png'),
    Category(name: 'Salud bucal', image: 'assets/bucal.png'),
    Category(name: 'Hogar', image: 'assets/hogar.png'),
  ];

  final List<Marca> marca = [
    Marca(name: 'Genven', image: 'assets/genven.png'),
    Marca(name: 'The Ordinary', image: 'assets/ordinary.png'),
    Marca(name: 'Coca-cola', image: 'assets/cocacola.png'),
  ];

  final List<BottomNavigationBarItem> _menuItems = [
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
                icon: Icon(Icons.menu, color: Color.fromARGB(255, 0, 87, 255)),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: Color.fromARGB(255, 0, 87, 255)),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                onPressed: () {},
              ),
            ],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Image.asset(
            'assets/logo.png',
            height: 80.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: IconButton(
              icon: Icon(Icons.supervised_user_circle, color: Color.fromARGB(255, 0, 87, 255)),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, color: Color.fromARGB(255, 0, 87, 255)),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar un producto',
                  suffixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 27.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextButton.icon(
                        icon: Icon(Icons.star, color: Colors.blue, size: 12),
                        label: Text('Más vendidos', 
                             style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400)),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                        ),
                      ),
                    ),
                  ),
                  
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextButton.icon(
                        icon: Icon(Icons.location_on, color: Colors.blue, size: 12),
                        label: Text('Carúpano - 5km', 
                             style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400)),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                        ),
                      ),
                    ),
                  ),
                  
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextButton.icon(
                        icon: Icon(Icons.filter_list, color: Colors.blue, size: 12),
                        label: Text('Filtrar búsqueda', 
                             style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400)),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 16.0, right: 15.0, bottom: 8.0),
              child: Text(
                "Recomendados para ti",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 67, 67, 67),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
  color: Color.fromARGB(255, 25, 216, 234),
  child: Column(
    children: [
      SizedBox(
        height: 160,
        child: PageView.builder(
          controller: PageController(
            viewportFraction: 0.55, // This controls how much space each page occupies
          ),
          itemCount: imagePaths.length,
          padEnds: false, // Removes extra padding at ends
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0), // Space between items
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePaths[index],
                  width: 140,  // Explicit width
                  height: 140, // Matches height to make square
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    ],
  ),
),
            
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 16.0, right: 15.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categorías",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 67, 67, 67),
                    ),
                  ),
                  Text(
                    "Ver todas",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 114, 109, 109),
                    ),
                  ),
                ]
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.7,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 110,
                    child: CategoryButton(category: categories[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  height: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage('assets/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 16.0, right: 15.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Buscar por marca",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 67, 67, 67),
                    ),
                  ),
                  Text(
                    "Ver todas",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 87, 255),
                    ),
                  ),
                ]
              ),
            ),
            SizedBox(height: 20.0),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.8,
                ),
                itemCount: marca.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 110,
                    child: MarcaButton(marca: marca[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 25.0, bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Malestar General",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 67, 67, 67),
                    ),
                  ),
                  Text(
                    "Ver todas",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 87, 255),
                    ),
                  ),
                ]
              ),
            ),
            SizedBox(
              height: 290,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                itemCount: (products.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final firstIndex = index * 2;
                  final secondIndex = firstIndex + 1;
                  
                  return Container(
                    width: MediaQuery.of(context).size.width*0.92,
                    margin: EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildProductCard(products[firstIndex]),
                        ),
                        SizedBox(width: 15),
                        if (secondIndex < products.length)
                          Expanded(
                            child: _buildProductCard(products[secondIndex]),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 16.0, right: 25.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Marcas Asociadas",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 67, 67, 67),
                    ),
                  ),
                  Text(
                    "Ver todas",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 87, 255),
                    ),
                  ),
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.9,
                ),
                itemCount: marca.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 110,
                    child: MarcaButton(marca: marca[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 0),
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