import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_medizin/carritodecompras.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'categorias/categorias.dart';
import 'busqueda/busqueda.dart';
import 'filtros.dart';
import 'busqueda2/busqueda2.dart';
import 'menudesplegado.dart';

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
        fontFamily: 'Poppins', 
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
    return SizedBox(
      width: 80,
      child: SingleChildScrollView(
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
                    fontSize: 12,
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


Color getcolor(int index) {
    return _currentIndex == index ? Color.fromARGB(255,0,87,255) : Color.fromARGB(255, 67, 67, 67);
  }

  List<BottomNavigationBarItem> get _menuItems {
    return [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/inicio.png',
          width: 24,
          height: 24,
          color: getcolor(0),
        ),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/categoria.png', width: 24, height: 24,
        color: getcolor(1)),
        label: 'Categoría',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/favoritos.png', width: 24, height: 24,
        color: getcolor(2)),
        label: 'Favoritos',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/creditos.png', width: 24, height: 24,
        color: getcolor(3)),
        label: 'Creditos',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/servicios.png', width: 24, height: 24,
        color: getcolor(4)),
        label: 'Servicios',
      ),
    ];
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
                icon: Icon(Icons.menu, color: Color.fromARGB(255, 0, 87, 255)),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: Color.fromARGB(255, 0, 87, 255)),
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
              icon: Icon(Icons.account_circle_outlined, color: Color.fromARGB(255, 0, 87, 255)),
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuD()),
                  );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Color.fromARGB(255, 0, 87, 255)),
              onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Carrito()),
                  );},
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
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 16, right: 16),
              child: TextField(
                onChanged: (text) {
                    if (text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MedicineSearchScreen(query: text)),
                      );
                    }
                  },
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
                children: [
                   Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: TextButton.icon(
                        icon: Icon(Icons.star_border_outlined, color: Color.fromARGB(255, 81, 110, 250), size: 12),
                        label: Text('Más vendidos', 
                             style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 81, 110, 250), fontWeight: FontWeight.w300)),
                        onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Busqueda2()),
                  );},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Elimina el padding horizontal y vertical
                          minimumSize: Size.zero,tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                           visualDensity: VisualDensity.compact,
                        ),
                      ),
                    ),
                  Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: TextButton.icon(
                        icon: Icon(Icons.location_on_outlined, color: Color.fromARGB(255, 81, 110, 250), size: 12,),
                        
                        label: Text('Carúpano - 5km', 
                             style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 81, 110, 250), fontWeight: FontWeight.w300)),
                        onPressed: () {
                            _abrirModalBottomSheet(context);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Elimina el padding horizontal y vertical
                          minimumSize: Size.zero,tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                           visualDensity: VisualDensity.compact,
                        ),
                      ),
                  ),
                  Spacer(),
                     Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: TextButton.icon(
                        icon: Icon(Icons.tune, color: Color.fromARGB(255, 81, 110, 250), size: 12),
                        label: Text('Filtrar búsqueda', 
                             style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 81, 110, 250), fontWeight: FontWeight.w300)),
                        onPressed: () {
                          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Filtros()),
                  );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Elimina el padding horizontal y vertical
                          minimumSize: Size.zero,tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                           visualDensity: VisualDensity.compact,
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
            SizedBox(height: 5.0),
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
                  TextButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Categorias()),
                      );
                    },
                    child: Text(
                      "Ver todas",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 114, 109, 109),
                      ),
                    ),
                  ),
                ]
              ),
            ),
            SizedBox(height: 0.0),
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
              padding: const EdgeInsets.only(left: 15.0, top: 6.0, right: 15.0, bottom: 8.0),
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
            SizedBox(height: 0.0),
            
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
              padding: const EdgeInsets.only(left: 15.0, top: 0.0, right: 25.0, bottom: 8.0),
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            //top: BorderSide(color: Colors.black, width: 1.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10.0,
              offset: Offset(0, -2)
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14.5),
            topRight: Radius.circular(14.5),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14.5),
            topRight: Radius.circular(14.5),
          ),
          child: BottomNavigationBar(
            items: _menuItems,
            currentIndex: _currentIndex,
            selectedItemColor: Color.fromARGB(255, 0, 87, 255),
            unselectedItemColor: Color.fromARGB(255, 67, 67, 67),
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
          ),
        ),
      )
    );
  }
}
Widget _buildSocialButton({
    required String imagePath,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          backgroundColor: Color.fromARGB(255, 235, 235, 235),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                icon: Icon(Icons.location_on_outlined, color: Color.fromARGB(255, 0, 87, 255)),
                padding: EdgeInsets.zero,
                iconSize: 25,
                onPressed: () {},
              ),
                RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[700],
              ),
              children: [
                TextSpan(
                  text: "Ubicación \n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Color.fromARGB(255, 139, 139, 139),
                    fontFamily: 'Poppins',
                  ),
                ),
                TextSpan(
                  text: "Carúpano",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 0, 87, 255),
                    decoration: TextDecoration.none,
                    fontFamily: 'Poppins',
                  ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
  

  Widget _buildSocialButton2({
    required String imagePath,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          backgroundColor: Color.fromARGB(255, 235, 235, 235),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                icon: Icon(Icons.radio_button_checked_outlined, color: Color.fromARGB(255, 0, 87, 255)),
                padding: EdgeInsets.zero,
                iconSize: 25,
                onPressed: () {},
              ),
                RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[700],
              ),
              children: [
                TextSpan(
                  text: "Radio \n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Color.fromARGB(255, 139, 139, 139),fontFamily: 'Poppins',
                  ),
                ),
                TextSpan(
                  text: "5 kilómetros",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 0, 87, 255),
                    decoration: TextDecoration.none,fontFamily: 'Poppins',
                  ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
 
void _abrirModalBottomSheet(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, // Permite cerrar tocando fuera
    builder: (BuildContext context) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.86,
          width: MediaQuery.of(context).size.width * 0.95,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text(
                'Cambiar Ubicación',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'Poppins',

    decoration: TextDecoration.none,
                ),
              ),
              
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       const SizedBox(height: 20),
                       Padding(
                        padding: EdgeInsets.only(bottom: 10,left: 0),
                        
                        child: Text(
                          'Buscar por cuidad, localidad o código postal',
                          style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w900, color: Colors.black,
    decoration: TextDecoration.none,fontFamily: 'Poppins',),
                          textAlign: TextAlign.left,
                          
                        ),
                      ),
                      _buildSocialButton(
                        imagePath: 'assets/google.png',
                        label: 'Continue with Google',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 20),
                      _buildSocialButton2(
                        imagePath: 'assets/google.png',
                        label: 'Continue with Google',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
               SizedBox(height: 20),
               Container(
                height: 340,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 49, 49, 49),
                  borderRadius: BorderRadius.circular(19.0),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 25),
                  backgroundColor: Color.fromARGB(255, 0, 87, 255),
                  padding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 37.0),
                  shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.0),
                  ),
                ),
                child: Text(
                  'Aplicar Cambios',
                  style: TextStyle(fontFamily: 'Poppins',color: Colors.white,fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}